{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true; # コマンド補完
    autosuggestion.enable = true; # コマンド予測
    syntaxHighlighting.enable = true; 
    # oh-my-zsh
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
  };
}