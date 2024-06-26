{ config, pkgs, ... }:

{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    (nnn.override { withNerdIcons = true; })
  ];
}
