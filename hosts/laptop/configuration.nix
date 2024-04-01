# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Dubai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # # GNOME DE
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


  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bitteneite = {
    isNormalUser = true;
    description = "Abdullah";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };

  # Enable automatic login for the user.
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "bitteneite";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    kitty
    git
    gnome.gnome-tweaks
    # Stuff for neovim
    unzip
    wget
    curl
    gnumake
    ripgrep
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Set default applications
  environment.variables = {
    TERMINAL = "kitty";
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "bitteneite" = import ./home.nix;
    };
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
