{ pkgs, config, inputs, ... }:
{
  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    
    plugins = with pkgs; [
      hyprlandPlugins.hyprexpo
      hyprlandPlugins.hyprspace
    ];
  };
}