{ pkgs, config, inputs, ... }:
{
  home.username = "tatenami";
  home.homeDirectory = "/home/tatenami";

  # NixOS pkgs version
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    kitty
    rofi
    waybar
    xdg-utils
    google-chrome
    vscode
  ];

  imports = [
    ./zsh
  ];

  programs.git.enable = true;
}