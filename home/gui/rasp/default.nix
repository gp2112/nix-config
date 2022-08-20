    
{ config, pkgs, ... }:

{ 
  imports = [ ../common ];

  programs.beets = {
    enable = true;
    settings = {
      plugins = [ "fetchart" ];
    };
  };

}

