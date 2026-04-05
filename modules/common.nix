# 共通設定
# - マシンに依らず共通する項目
{ pkgs, config, ... }:
{
  # nix コマンド，flake の有効化
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # 非フリーソフトを許可　
  nixpkgs.config.allowUnfree = true;
}