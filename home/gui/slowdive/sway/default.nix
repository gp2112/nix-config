{ config, pkgs, ... }:

{
  
  imports = [ 
    ../../common/wayland 
    ./waybar
    ./swaylock.nix
  ];

  home.packages = with pkgs; [
        bemenu
        swayidle
        swaylock
        mako
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font.normal = {
        #family = "CascadiaCode";
        family = "FuraCode Nerd Font Mono:style=Medium,Regular";
        style = "Regular";
      };
    };
  };

  wayland.windowManager.sway = 

  let
    mod = "Mod4";
    super = "Mod1";
    left = "Left";
    down = "Down";
    up = "Up";
    right = "Right";
    term = "alacritty";
    menu = "bemenu-run | xargs swaymsg exec --";
    modepower = "(l) lock, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown";
    lock = "swaylock -f -i /home/gui/Pictures/doge.jpg";
  in {
    
    enable = true;

    config = {
      modifier = mod;

      terminal = term;
      
      defaultWorkspace = "workspace number 1";

      output = {
        "*" = {
          bg = "/home/gui/Pictures/swaybg.png fill";
        };
      };

      gaps = {
        inner = 6;
        outer = 10;
      };

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

      bars = [{
        command = "waybar";
      }];

      

      keybindings = {
        "${super}+p" = "exec shotman area";
        "${super}+Shift+p" = "exec shotman active";
        "${super}+Ctrl+p" = "exec shotman window";
        "${mod}+Shift+w" = "exec firefox";
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute"=" exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute"=" exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessDown" = " exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86Search" = "exec bemenu-run";
        "${mod}+d" = "exec ${menu}";
        "${mod}+Return" = "exec ${term}";
        "${mod}+Shift+q" = "kill";
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
        # Move your focus around
         "${mod}+${left}" = "focus left";
         "${mod}+${down}" = "focus down";
         "${mod}+${up}" = "focus up";
         "${mod}+${right} " = "focus right";
         "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";
          "${mod}+s" = "layout stacking";
          "${mod}+t" = "layout tabbed";
          "${mod}+e" = "layout toggle split";

          "${mod}+Shift+r" = "mode resize";
          "${mod}+v" = "split v";
          "${mod}+h" = "split h";
      };

      modes = {
        resize = {
          Down = "resize grow height 10 px";
          Escape = "mode default"; 
          Left = "resize shrink width 10 px"; 
          Return = "mode default"; 
          Right = "resize grow width 10 px"; 
          Up = "resize shrink height 10 px"; 
          h = "resize shrink width 10 px"; 
          j = "resize grow height 10 px"; 
          k = "resize shrink height 10 px"; 
          l = "resize grow width 10 px"; 
        };

        modepower = {
          "Shift+s" = "exec systemctl poweroff -i, mode default";
          r = "exec systemctl reboot, mode default";
          s = "exec ${lock} && systemctl suspend, mode default";
          h = "exec systemctl hibernate, mode default";
          l = "exec ${lock}, mode default";
          Escape = "mode default";
        };

      };





    };
  };

}
