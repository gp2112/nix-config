{ config, ... }:

{
  imports = [
    ../common/desktops/desktop-env/sway
  ];

  wayland.windowManager.sway = {

      config = {

        input = {
            "*" = {
              xkb_layout = "br";
            };
        };
        output = {
          "*" = {
            bg = "/home/gui/Pictures/swaybg.png fill";
          };
          "HDMI-A-2" = {
            position = "0,0";
            res = "1920x1080@60hz";
          };

          "DP-2" = {
            position = "1920,0";
            res = "1920x1080@144hz";
          };

        };
      };
    };

    programs.waybar.settings = {
      topBar = {
        output = ["DP-2"];
        modules-right = [ "pulseaudio" "network" "temperature" ];
      };

      bottomBar = {
        output = [ "DP-2" "HDMI-A-2" ];
      };

    };

    programs.fish.shellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ];
      exec sway
    end
  '';
  
}
