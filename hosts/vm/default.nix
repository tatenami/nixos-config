{ config, pkgs, ... }: 
{
  imports = [
    ../../modules/common.nix
    ../../modules/system.nix
    ../../modules/user.nix
    ../../modules/desktop/hyprland.nix
  ];

  virtualisation.vmVariant = {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    # services.desktopManager.plasma6.enable = true;

    services.dbus.enable = true;
    programs.dconf.enable = true;

    services.accounts-daemon.enable = true;
  };
  
  # VM 用ブートローダ・ファイルシステム
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
  };
}