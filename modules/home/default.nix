{ pkgs, config, inputs, ... }:
{
  home.username = "tatenami";
  home.homeDirectory = "/home/tatenami";

  # NixOS pkgs version
  home.stateVersion = "25.11";

  imports = [
    ./packages.nix # packages list
    ./hyprland
    ./zsh.nix
  ];

  xdg.configFile = {
    # "hypr" = {
    #   source = "${inputs.dotfiles}/hypr";
    #   recursive = true;
    # };
    "starship.toml" = {
      source = "${inputs.dotfiles}/starship.toml";
      recursive = true;
    };
  };

  programs.git.enable = true;

  # アプレットを常駐させるサービス
  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;
}