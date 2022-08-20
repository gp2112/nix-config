{config, pkgs, ...}:

{
  imports = [
    ../common/desktops/desktop-env/sway
  ];

  wayland.windowManager.sway.config = {
    input = {
        "*" = {
          xkb_layout = "us(intl)";
        };

        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          middle_emulation = "enabled";
        };

    };

    output = {
        "*" = {
          bg = "/home/gui/Pictures/swaybg.png fill";
        };
      };

  };

  programs.waybar.settings = {
    topBar = {
      output = ["eDP-1"];
      modules-right = [ "pulseaudio" "network" "backlight" "bluetooth" "temperature" "battery" ];
    };

    bottomBar = {

      output = [ "eDP-1" ];

    };

  };

  programs.fish.shellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ];
      exec sway
    end
  '';
}
