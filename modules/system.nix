
{ pkgs, ... }:

{
  # System Version
  system.stateVersion = "25.11";

  # マシン名
  # - 任意の名前でOK
  networking.hostName = "nixel";

  # Network
  networking.networkmanager.enable = true;

  # SSH 有効化
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    git 
    vim 
    wget 
    curl
  ];

  environment.variables.EDITOR = "vim";
}