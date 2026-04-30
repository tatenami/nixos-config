{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl"
      "waybar"
      "blueman-applet"
      "nm-applet"
      "dunst"
      "fcitx5"
    ];
  };
}