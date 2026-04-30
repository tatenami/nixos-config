{ pkgs, config, inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./bindings.nix
    ./exec-once.nix
    ./settings.nix
    ./theme.nix
    ./animation.nix
  ];
}