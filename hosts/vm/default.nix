{ config, pkgs, ... }: 
{
  imports = [
    ../../modules/common.nix
    ../../modules/system.nix
    ../../modules/user.nix
    ../../modules/desktop/hyprland.nix
  ];
  
  # VM 用ブートローダ・ファイルシステム
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
  };
}