{ pkgs, ...}:
{
  # ユーザ設定
  users.users.tatenami = {
    isNormalUser = true;
    # wheels: sudo 権限
    extraGroups =  [ "wheel" "networkmanager" ];
    initialPassword = "password";
  };
}
