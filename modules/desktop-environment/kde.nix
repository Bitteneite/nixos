# To be imported in configuration.nix
{ config, pkgs, users, ... }:

{
  # KDE Plasma: Desktop Environment
  
  #X11 windowing system
  services.xserver = {
    enable = true;
	displayManager.sddm.enable = true;
	desktopManager.plasma5.enable = true;
	layout = "us";
	xkbVariant = "";
	
	#displayManager.autoLogin.enable = true;
	#displayManager.autoLogin.user = "bitteneite";
	
  };
}
