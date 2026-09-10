if hl.plugin.hyprlight == nil then
  return false
end

local function setup()
  -- Define easeOutCubic bezier curve
  hl.curve("easeOutCubic", {
    type = "bezier",
    points = { { 0.33, 1.0 }, { 0.68, 1.0 } },
  })

  hl.animation({
    leaf = "hyprlightIn",
    enabled = false,
  })

  hl.animation({
    leaf = "hyprlightOut",
    enabled = true,
    speed = 6.0,
    bezier = "easeOutCubic",
  })
end

return {
  config = {
    enable = true,
    animate_workspacechange = false,
    animate_floating = true,
    only_on_monitor_change = false,
    keyboard_focus_animation = "illuminate",
    mouse_focus_animation = "none",
    light_color = 0xffffffff,
    light_intensity = 0.03,
  },
  setup = setup,
}
