{ pkgs, ... }:
{
  # hyprland
  programs.hyprland.enable = true;
  # Display manager
  services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "hyprland";

  xdg.portal.enable = true;
  services.dbus.enable = true;
  security.polkit.enable = true;

  # # VM graphic
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
}