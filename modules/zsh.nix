{ config, pkgs, ... }:

{
  # Zsh: Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "eza -la --group-directories-first";
      update = "sudo nixos-rebuild switch --flake";
      nixconfig = "nvim ~/.dotfiles";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
  
  users.defaultUserShell = pkgs.zsh;
}
