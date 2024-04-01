{ config, pkgs, users, ... }:

{
  # Zsh: Shell
  programs.zsh = {
    enable = true;

    shellAliases = {
      ls = "eza -la --group-directories-first";
      update = "sudo nixos-rebuild switch --flake";
      nixconfig = "nvim ~/.dotfiles";
    };

    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  
      autosuggestions.enable = true;
	  syntaxHighlighting.enable = true;
	  enableCompletion = true;
  
  };
  
  users.defaultUserShell = pkgs.zsh;
}
