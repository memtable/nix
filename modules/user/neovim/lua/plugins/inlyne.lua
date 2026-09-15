local jobs = {}

local function toggle()
  local bufnr = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(bufnr)

  if file == "" or vim.bo[bufnr].filetype ~= "markdown" then
    vim.notify("Not a saved markdown file", vim.log.levels.WARN)
    return
  end

  if jobs[bufnr] and vim.fn.jobwait({ jobs[bufnr] }, 0)[1] == -1 then
    vim.fn.jobstop(jobs[bufnr])
    jobs[bufnr] = nil
    vim.notify("Closed Inlyne preview", vim.log.levels.INFO)
    return
  end

  if vim.bo[bufnr].modified then
    vim.cmd("silent write")
  end

  local job_id = vim.fn.jobstart({ "inlyne", "view", file }, {
    on_exit = function()
      jobs[bufnr] = nil
    end,
  })

  if job_id > 0 then
    jobs[bufnr] = job_id
    vim.notify("Opened Inlyne preview", vim.log.levels.INFO)

    vim.api.nvim_create_autocmd("BufDelete", {
      buffer = bufnr,
      once = true,
      callback = function()
        if jobs[bufnr] then
          vim.fn.jobstop(jobs[bufnr])
          jobs[bufnr] = nil
        end
      end,
    })
  else
    vim.notify("Failed to start Inlyne", vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    for _, id in pairs(jobs) do
      pcall(vim.fn.jobstop, id)
    end
  end,
})

return {
  dir = vim.fn.stdpath("config"),
  name = "inlyne",
  ft = { "markdown" },
  cmd = { "Inlyne", "InlyneToggle" },
  keys = {
    { "<leader>mp", toggle, desc = "Toggle Inlyne preview", ft = { "markdown" } },
  },
  config = function()
    vim.api.nvim_create_user_command("InlyneToggle", toggle, {})
    vim.api.nvim_create_user_command("Inlyne", toggle, {})
  end,
}
