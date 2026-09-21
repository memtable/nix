local startup = {
  "hyprctl setcursor macOS 24",
  "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XCURSOR_THEME XCURSOR_SIZE",
  "systemctl --user start hyprland-session.service",
  "systemctl --user start hyprpolkitagent",
  "gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"",
  "hyprctl plugin load /home/drama/Projects/Hyprland/build/hyprlight.so",
  "hyprctl plugin load /home/drama/git/HyprAppMenu/hypr-appmenu.so",
  "hyprctl plugin load /home/drama/git/hyprglass/hyprglass.so",
  "wl-paste --type image --watch cliphist store",
  "wl-paste --type text --watch cliphist store",
  "easyeffects --gapplication-service",
  "sleep 2 && hyprpm reload -n",
  "/usr/bin/xembedsniproxy &",
  "swww-daemon --format xrgb",
  "waypaper daemon",
  -- "otd-daemon",
  "vicinae server &",
  "nm-applet &",
  "hyprsunset",
  "windscribe-cli connect &",
  "spotify --disable-gpu --ozone-platform=wayland --enable-blink-features=MiddleClickAutoscroll",
  "Telegram -startintray &",
  -- "waypaper --restore",
  "env MALLOC_CONF=\"background_thread:true,dirty_decay_ms:1000,muzzy_decay_ms:1000\" quickshell",
  "hypridle",
  -- "wal -R",
  "steam",
}

hl.on("hyprland.start", function()
  for _, cmd in ipairs(startup) do
    hl.exec_cmd(cmd)
  end
end)
