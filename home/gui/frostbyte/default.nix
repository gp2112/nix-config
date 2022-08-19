{ config, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops
    ../common/wayland
    ../common/sway
  ];

   
  home.packages = with pkgs; [ 
    cava
  ];

  wayland.windowManager.sway.config = {
    input = {
        "*" = {
          xkb_layout = "br";
        };
        
    };

    /*output = {
      "*" = {
        bg = "/home/gui/Pictures/swaybg.png fill";
      };
    };*/
  };


  programs.waybar.settings = {
    topBar = {
      output = ["DP-1"];
      modules-right = [ "pulseaudio" "network" "temperature" ];
    };

    bottomBar = {
      output = [ "DP-1" ];
    };

  };


}
