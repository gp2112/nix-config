{ config, pkgs, ... }:

let
  lock = "swaylock -f --screenshots --clock --effect-blur 7x4 --effect-vignette 0.3:0.8";

in {
  imports = [
    ../../wayland
    ./waybar
    ../../terminal-emulator/kitty
  ];

  home.packages = with pkgs; [
        mako
        sirula
        sway-contrib.grimshot
        swaylock-effects
        autotiling
  ];

  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = lock; }

    ];

    timeouts = [
      { timeout = 30; command = lock; }
      { timeout = 600; command = lock; }
    ];

  };


  wayland.windowManager.sway =

  let
    mod = "Mod4";
    super = "Mod1";
    left = "Left";
    down = "Down";
    up = "Up";
    right = "Right";
    term = "kitty";
    menu = "sirula";
    modepower = "(l) lock, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown";

  in {

    enable = true;

    wrapperFeatures.gtk = true;

    config = {
      modifier = mod;

      terminal = term;
      defaultWorkspace = "workspace number 1";


      gaps = {
        inner = 6;
        outer = 10;
      };


      bars = [{
        command = "waybar";
      }];


      startup = [
        { command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK"; }
        { command = "autotiling"; }
      ];


      keybindings = {
        "${super}+p" = "exec grimshot copy area";
        "${super}+Shift+p" = "exec grimshot copy active";
        "${super}+Ctrl+p" = "exec grimshot copy window";
        "${mod}+Shift+w" = "exec firefox";
        "${mod}+Shift+p" = "exec firefox --private-window";
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute"=" exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute"=" exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessDown" = " exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86Search" = "exec ${menu}";
        "${mod}+d" = "exec ${menu}";
        "${mod}+Return" = "exec ${term}";
        "${mod}+Shift+Return" = "exec ${term} --class=${term}float";
        "${mod}+Shift+q" = "kill";
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
        # Move your focus around
         "${mod}+${left}" = "focus left";
         "${mod}+${down}" = "focus down";
         "${mod}+${up}" = "focus up";
         "${mod}+${right}" = "focus right";
         "${mod}+Shift+${left}" = "move left";
         "${mod}+Shift+${down}" = "move down";
         "${mod}+Shift+${up}" = "move up";
         "${mod}+Shift+${right} " = "move right";
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
          "${mod}+f" = "floating toggle";

          "${mod}+Shift+r" = "mode resize";
          "${mod}+v" = "split v";
          "${mod}+h" = "split h";

          "${mod}+Shift+l" = "exec ${lock}";
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


      floating.criteria = [
        { title = "Picture-in-Picture"; }
        { title = "Write: .*"; }
        { app_id = "${term}float"; }

      ];

      window.commands = [
        {
          criteria = { app_id = term; };
          command = "opacity set 0.75";
        }
        {
          criteria = { app_id = "${term}float"; };
          command = "resize set width 700 px height 450 px, move position 1000 200";
        }
        {
          criteria = { title = "Picture-in-Picture"; };
          command = "resize set width 800 px height 500 px";
        }
      ];


    };
  };

}
