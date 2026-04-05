# 共通設定
# - マシンに依らず共通する項目

{
  # タイムゾーン
  time.timeZone = "Asia/Tokyo";
  # システムロケール
  i18n.defaultLocale = "en_US.UTF-8"; # 日本語環境なら ja_JP.utf8

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}