{ config, pkgs, lib, ... }:

let
  link = config.lib.file.mkOutOfStoreSymlink;
  hyprDir = "${config.home.homeDirectory}/dotfiles/modules/user/hyprland";
in {

  imports = [
    ../quickshell
    ../kitty
  ];

  home.packages = with pkgs; [
    # Hyprland helpers
    hyprpicker
    hyprsunset
    hyprfreeze
    hypridle
    wlrctl
    ydotool

    # Screenshots / clipboard / wallpapers
    wl-clipboard
    cliphist
    slurp
    satty
    grim
    jq

    # Launchers / shell
    vicinae
    rofi

    # Apps called directly from binds / exec-once
    mission-center
    brightnessctl
    easyeffects
    pavucontrol
    playerctl
    libnotify
    nautilus

    # Tray / desktop helpers
    kdePackages.plasma-workspace
    networkmanagerapplet
  ];

  xdg.configFile = {
    "hypr/hyprland.lua".source = link "${hyprDir}/hyprland.lua";
    "hypr/hyprland_nested.lua".source = link "${hyprDir}/hyprland_nested.lua";
    "hypr/lib.lua".source = link "${hyprDir}/lib.lua";
    "hypr/modules".source = link "${hyprDir}/modules";
  };

  home.sessionVariables = {
    EWW_PRIMARY_MONITOR = lib.mkDefault "1";
    MOZ_ENABLE_WAYLAND = lib.mkDefault "1";
    XDG_SESSION_TYPE = lib.mkDefault "wayland";
    QT_QPA_PLATFORM = lib.mkDefault "wayland";
    LIBVA_DRIVER_NAME = lib.mkDefault "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = lib.mkDefault "nvidia";
    ELECTRON_OZONE_PLATFORM_HINT = lib.mkDefault "auto";
    GBM_BACKEND = lib.mkDefault "nvidia-drm";
    NVD_BACKEND = lib.mkDefault "direct";
    QT_QPA_PLATFORMTHEME = lib.mkDefault "qt6ct";
    XCURSOR_THEME = lib.mkDefault "macOS";
    HYPRCURSOR_THEME = lib.mkDefault "macOS";
    XCURSOR_SIZE = lib.mkDefault "24";
    HYPRCURSOR_SIZE = lib.mkDefault "24";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    systemd = {
      enable = false;
      variables = [ "--all" ];
    };
  };
}
