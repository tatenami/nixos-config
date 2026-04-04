{ config, pkgs, ... }: 
{
  system.stateVersion = "25.11";
  nix.setting.experimental-features = [ "nix-command" "flakes" ];
  
  # VM 用ブートローダ
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  # Network
  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  users.users.tatenami = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "password";

    packages = with pkgs; [

    ];
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];

  environment.variables.EDITOR = "vim";

  # hyprland
  programs.hyprland.enable = true;

  # Display manager
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  services.dbus.enable = true;
  security.polkit.enable = true;

  # VM graphic
  services.xserver.videoDrivers = [ "modesetting" ];
}