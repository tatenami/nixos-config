{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      layout = "dwindle";

      gaps_in = 5;
      gaps_out = 8;
      border_size = 3;
      resize_in_border = true;

      "col.active_border"   = "rgba(00fff3ff) rgba(00ffaaff) 45deg";
      "col.inactive_border" = "rgba(505050cc) rgba(6c7086cc) 45deg";
    };

    decoration = {
      rouding = 7;
    };
  };
}