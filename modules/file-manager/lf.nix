{ config, pkgs, ... }:

{
  programs.lf = {
    
    enable = true;
 
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
  };

}
