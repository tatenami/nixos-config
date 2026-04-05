# 共通設定
# - マシンに依らず共通する項目
{ pkgs, config, ...}:
{
  # nix コマンド，flake の有効化
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
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
    ];
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
}