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
          xkb_layout = "br-abnt-2";
        };
        
    };

    output = {
        "*" = {
          bg = "/home/gui/Pictures/swaybg.png fill";
        };
      };

  };


}
