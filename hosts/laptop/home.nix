{ config, pkgs, ... }:

{
  imports = [
  ./../../modules/zsh.nix
  ./../../modules/file-manager/nnn.nix
  ];
  
  # User info
  home.username = "bitteneite";
  home.homeDirectory = "/home/bitteneite";


  # You should not change this value
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Nix Packages to install
  home.packages = with pkgs; [
    
    # Terminal Stuff
    eza
    zellij

    # Terminal Tools & Helpers
    tlrc
    
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

  ];



  # Kitty: Terminal Emulator
  programs.kitty = {
    enable = true;
    theme = "srcery";
    font.package = pkgs.udev-gothic-nf;
    font.name = "JetBrainsMono Nerd Font";
    settings = {
      # hide_window_decorations = true;
    };
    font.size = 14;
  };

  # Defaults
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
