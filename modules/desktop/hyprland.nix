{ pkgs, ... }:
{
  # wayland
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-hyprland
  ];

  # hyprland
  programs.hyprland.enable = true;
  # Display manager
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };

    defaultSession = "hyprland";
  };

  services.dbus.enable = true;
  security.polkit.enable = true;

  # VM graphic
  services.xserver.enable = false;
  services.xserver.videoDrivers = [ "modesetting" ];
}