# To be imported in /hosts/.../configuration.nix
{ config, pkgs, users, ... }:

{
  # GNOME: Desktop Environment
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # # Excluding GNOME packages
  environment.gnome.excludePackages = (with pkgs; [
    #gnome-photos
    gnome-tour        # Welcome Help
    gedit             # Text Editor
  ]) ++ (with pkgs.gnome; [
    baobab            # Disk Usage Analyzer
    cheese            # Photo Booth
    totem             # Video Player
    simple-scan       # Document Scanner
    gnome-music
    # gnome-console
    # gnome-terminal
    epiphany          # Web Browser
    geary             # Email Reader
    evince            # Document Viewer
    gnome-characters
    yelp              # Help
    file-roller       # Archive/Zip
    seahorse          # Password Manager
    tali              # Poker Game
    iagno             # Go Game
    hitori            # Sodoku
    atomix            # Puzzle

    # Self Explanatory Stuff
    gnome-calendar gnome-clocks gnome-contacts gnome-font-viewer gnome-logs gnome-maps gnome-weather gnome-disk-utility
  ]);
  
  # Removing bloat
  services.xserver.excludePackages = [
    pkgs.xterm        # X11 Terminal Emulator
  ];
  programs.nano.enable = false; # Removing Nano (Use Neovim!)

}
