{ config, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops
    ../common/wayland
    ../common/sway
  ];

   
  home.packages = with pkgs; [ 
    cava
    konsole
  ];

  wayland.windowManager.sway.config = {
    input = {
        "*" = {
          xkb_layout = "br";
        };
        
    };

    *output = {
      #"*" = {
      #  bg = "/home/gui/Pictures/swaybg.png fill";
      #};
      "HDMI-A-2" = {
        position = "1920,0";
      };

      "DP-2" = {
        position = "0,0";
      };

    };
  };


  programs.waybar.settings = {
    topBar = {
      output = ["DP-2"];
      modules-right = [ "pulseaudio" "network" "temperature" ];
    };

    bottomBar = {
      output = [ "DP-2" ];
    };

  };


}
