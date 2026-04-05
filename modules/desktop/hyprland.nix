{ pkgs, ... }:
{
  # hyprland
  programs.hyprland.enable = true;

  # Display manager
  services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "hyprland";

  services.dbus.enable = true;
  security.polkit.enable = true;

  # VM graphic
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  # 非フリーソフトを許可　
  nixpkgs.config.allowUnfree = true;

  # Applications
  environment.systemPackages = with pkgs; [
    kitty
    rofi
    waybar
    xdg-utils
    google-chrome
    vscode
  ];
}