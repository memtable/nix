if hl.plugin.hyprglass == nil then
  return false
end

local config = {
  enabled = true,
  manage_window_blur = true,
  default_theme = "dark",
  default_preset = "default",
  layers = {
    enabled = true,
  },
}

local presets = {
  default = {
    blur_strength = 12,
    blur_iterations = 5,
    refraction_strength = 3.0,
    chromatic_aberration = 0.02,
    fresnel_strength = 0.0,
    specular_strength = 0.0,
    glass_opacity = 1.0,
    edge_thickness = 0.01,
    tint_color = 0xffffff0d,
    lens_distortion = 0.0,
    dark = {
      brightness = 0.6,
      contrast = 1.0,
      saturation = 1.5,
      vibrancy = 3.0,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.2,
      adaptive_boost = 0.0,
    },
    light = {
      brightness = 1.12,
      contrast = 0.92,
      saturation = 0.85,
      vibrancy = 0.12,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.0,
      adaptive_boost = 0.0,
    },
  },

  heavy = {
    inherits = "default",
    blur_strength = 12,
    blur_iterations = 5,
    refraction_strength = 3.0,
    chromatic_aberration = 0.02,
    fresnel_strength = 0.0,
    specular_strength = 0.0,
    glass_opacity = 1.0,
    edge_thickness = 0.01,
    tint_color = 0xffffff0d,
    lens_distortion = 0.0,
    dark = {
      brightness = 0.6,
      contrast = 1.0,
      saturation = 1.5,
      vibrancy = 3.0,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.2,
      adaptive_boost = 0.0,
    },
    light = {
      brightness = 1.12,
      contrast = 0.92,
      saturation = 0.85,
      vibrancy = 0.12,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.0,
      adaptive_boost = 0.0,
    },
  },

  menus = {
    inherits = "default",
    blur_strength = 3,
    blur_iterations = 2,
    refraction_strength = 3.0,
    chromatic_aberration = 0.20,
    fresnel_strength = 0.2,
    specular_strength = 0.5,
    glass_opacity = 1.0,
    edge_thickness = 0.01,
    tint_color = 0xffffff0d,
    lens_distortion = 0,
    dark = {
      brightness = 0.4,
      contrast = 1.0,
      saturation = 2.0,
      vibrancy = 2.5,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.0,
      adaptive_boost = 0.0,
    },
    light = {
      brightness = 1.06,
      contrast = 0.95,
      saturation = 0.9,
      vibrancy = 0.16,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.0,
      adaptive_boost = 0.3,
    },
  },

  clear = {
    inherits = "default",
    glass_opacity = 1.0,
    blur_strength = 1,
    blur_iterations = 2,
    refraction_strength = 5.0,
    chromatic_aberration = 0.02,
    s_curve = 0.0,
    -- fresnel_strength = 1.3,
    -- specular_strength = 1.7,
    edge_thickness = 0.05,
    tint_color = 0xffffff0d,
    lens_distortion = 0.0,
    dark = {
      brightness = 1.0,
      contrast = 1.0,
      saturation = 1.2,
      vibrancy = 1.0,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.0,
      adaptive_boost = 0.0,
    },
    light = {
      brightness = 1.0,
      contrast = 1.0,
      saturation = 1.0,
      vibrancy = 0.0,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.0,
      adaptive_boost = 0.0,
    },
  },

  clear_s_curve = {
    inherits = "clear",
    s_curve = 0.2,
  },

  notification_buttons = {
    inherits = "clear",
    blur_strength = 0.6,
    blur_iterations = 1,
    dark = {
      brightness = 1.0,
      contrast = 1.2,
      saturation = 1.0,
      vibrancy = 0.0,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.30,
      adaptive_boost = 0,
    },
  },

  notification = {
    inherits = "clear",
    blur_strength = 2,
    blur_iterations = 3,
    tint_color = 0xFFFFFF1D,
    fresnel_strength = 1,
    specular_strength = 0,
    lens_distortion = 0.0,
    refraction_strength = 4.0,
    chromatic_aberration = 0.0,
    edge_thickness = 0.04,
    s_curve = 0.5,
    dark = {
      brightness = 1.0,
      contrast = 1.2,
      saturation = 1.6,
      vibrancy = 0.0,
      vibrancy_darkness = 0.0,
      adaptive_dim = 0.22,
      adaptive_boost = 0.0,
    },
  },

  darken = {
    inherits = "default",
    blur_strength = 2,
    blur_iterations = 7,
    refraction_strength = 3,
    chromatic_aberration = 0.02,
    fresnel_strength = 0.0,
    specular_strength = 0.0,
    glass_opacity = 1.0,
    edge_thickness = 0.01,
    tint_color = 0x00000000,
    s_curve = 1.0,
    lens_distortion = 0.0,
    dark = {
      brightness = 0.2,
      contrast = 1.0,
      saturation = 2.5,
      vibrancy = 2.5,
      vibrancy_darkness = 1.5,
      adaptive_dim = 0.0,
      adaptive_boost = 0.0,
    },
    light = {
      brightness = 0.55,
      contrast = 1.0,
      saturation = 1.0,
      vibrancy = 0.0,
      vibrancy_darkness = 1.0,
      adaptive_dim = 0.8,
      adaptive_boost = 0.0,
    },
  },
}

local layers = {
  {
    name = "quickshell:control-center-empty-slot",
    exclude = true,
  },
  {
    name = "quickshell:control-center-tile-1x1",
    preset = "clear",
    mask_threshold = 0.1,
    rounding  = 100,
  },
  {
    name = "quickshell:control-center-tile-2x1",
    preset = "clear",
    mask_threshold = 0.1,
    rounding  = 100,
  },
  {
    name = "quickshell:control-center-tile-2x2",
    preset = "clear_s_curve",
    mask_threshold = 0.1,
    rounding  = 35,
  },
  {
    name = "quickshell:control-center-tile-4x1",
    preset = "clear_s_curve",
    mask_threshold = 0.1,
    rounding = 25,
  },
  {
    name = "quickshell:control-center-footer",
    preset = "clear",
    mask_threshold = 0.1,
    rounding = 100,
  },
  {
    name = "quickshell:control-center-privacy",
    preset = "clear",
    mask_threshold = 0.1,
    rounding = 20,
  },
  {
    name = "quickshell:osd",
    preset = "clear",
    mask_threshold = 0.1,
    rounding = 20,
  },
  {
    name = "quickshell:desktop-widget-(calendar|weather):.*",
    preset = "clear",
    mask_threshold = 0.0,
  },
  {
    name = "quickshell:menu",
    preset = "menus",
    mask_threshold = 0.0,
    rounding = 12,
    no_anim = true,
  },
  {
    name = "quickshell:notifications",
    preset = "notification",
    mask_threshold = 0.005,
    rounding = 20,
  },
  {
    name = "quickshell:notification-popup-backdrop",
    preset = "notification",
    mask_threshold = 0.01,
    rounding = 20,
  },
  {
    name = "quickshell:toggle-knob-backdrop",
    preset = "clear",
    mask_threshold = 0.01,
    rounding = 15,
  },
  {
    name = "quickshell:toggle-slider-backdrop",
    preset = "clear",
    mask_threshold = 0.01,
    rounding = 15,
  },
  {
    name = "quickshell:notification-center",
    preset = "clear",
    mask_threshold = 0.01,
  },
  {
    name = "quickshell:notification-actions",
    preset = "notification_buttons",
    mask_threshold = 0.001,
  },
  {
    name = "quickshell:notification-dismiss",
    preset = "notification_buttons",
    mask_threshold = 0.001,
  },
  {
    name = "quickshell:notification-center",
    preset = "notification",
    mask_threshold = 0.01,
    rounding  = 0,
  },
  {
    name = "quickshell:control-center",
    preset = "clear",
    mask_threshold = 0.01,
    rounding = 24,
  },
}

local function setup()
  local hg = hl.plugin.hyprglass

  if hg == nil then
    return
  end

  hg.config(config)

  hg.preset("default", presets.default)
  hg.preset("heavy", presets.heavy)
  hg.preset("menus", presets.menus)
  hg.preset("clear", presets.clear)
  hg.preset("clear_s_curve", presets.clear_s_curve)
  hg.preset("notification_buttons", presets.notification_buttons)
  hg.preset("notification", presets.notification)
  hg.preset("darken", presets.darken)

  for _, layer in ipairs(layers) do
    local layer_cfg = {
      preset = layer.preset,
      mask_threshold = layer.mask_threshold,
      rounding = layer.rounding,
      exclude = layer.exclude,
    }

    hg.layer(layer.name, layer_cfg)
  end

  -- Per-window rules
  hl.window_rule({
    name = "terminal",
    match = { class = "^(kitty(-.*)?|com\\.mitchellh\\.ghostty|ghostty(-.*)?)$" },
    tag = "+hyprglass_preset_darken",
  })

  hl.window_rule({
    name = "zen",
    match = { class = "^(zen(-.*)?|zen)$" },
    tag = "+hyprglass_preset_heavy",
  })
end

return {
  config = config,
  setup = setup,
}
