{ pkgs, config, inputs, ... }:
{
  home.packages = with pkgs; [
    # Hyprland related
    hyprlock   
    hyprpicker
    

    # network tray
    networkmanagerapplet
    # terminal
    kitty
    ghostty
    # application manager
    rofi

    waybar
    xdg-utils
    # browser
    google-chrome
    # editor
    vscode
    # user env for NixOS 
    home-manager

    # desktop notification
    dunst
    # screen shot
    grim
    slurp
    satty
    # screen capture
    wf-recorder
    # clipborad
    clipse
    # explorer
    xfce.thunar
    yazi
    # prompt
    starship
  ];
}