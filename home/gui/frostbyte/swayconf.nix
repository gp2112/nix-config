{ config, pkgs,... }:

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
        modules-right = [ "custom/gpu" "disk" "memory" "pulseaudio" "network" "temperature" ];

        "custom/gpu" = {
          interval = 5;
          format = "﴿ {}%";
          exec = pkgs.writeShellScript "gpu" ''
            cat /sys/class/graphics/fb0/device/gpu_busy_percent
          '';
        };
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
