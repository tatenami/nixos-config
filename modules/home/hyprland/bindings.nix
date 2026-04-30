{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER"; # windows key

    # apps binding
    "$term" = "ghostty";
    "$editor" = "code";
    "$browser" = "google-chrome-stable";
    "$file" = "thunar";

    "$resize-gap" = "20";

    bind = [
      # reload config
      "$mod, M, exec, hyprctl reload"
      # toggle floating state 
      "$mod+Shift, F, togglefloating,"
      
      # App shortcut
      "$mod, T, exec, $term"
      "$mod, E, exec, $file"
      "$mod, F, exec, $browser"
      "$mod, A, exec, rofi -show drun"

      # workspace switch
      "$mod+Ctrl, Right, workspace, r+1"
      "$mod+Ctrl, Left,  workspace, r-1"
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # move window to worspace
      "$mod+Ctrl+Alt, Right, movetoworkspace, r+1"
      "$mod+Ctrl+Alt, Left,  movetoworkspace, r-1"

      # resize window
      "$mod+Shift, Right, resizeactive, $resize-gap 0"
      "$mod+Shift, Left,  resizeactive, -$resize-gap 0"
      "$mod+Shift, Up,    resizeactive, 0 -$resize-gap"
      "$mod+Shift, Down,  resizeactive, 0 $resize-gap"
    ];
    
  };
}