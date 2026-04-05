
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

  # dbus 有効化
  services.dbus.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    git 
    vim 
    wget 
    curl
  ];

  environment.variables.EDITOR = "vim";

  # タイムゾーン
  time.timeZone = "Asia/Tokyo";
  # システムロケール
  i18n.defaultLocale = "en_US.UTF-8"; # 日本語環境なら ja_JP.utf8

  # 日本語入力
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      qt6Packages.fcitx5-qt
      qt6Packages.fcitx5-configtool
    ];
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    QT_IM_MODULES = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  environment.variables = {
    INPUT_METHOD = "fcitx";
  };
}