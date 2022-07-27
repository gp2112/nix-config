{ config, pkgs, ... }:

{
  
  imports = [ ../../common/wayland ./waybar];

  home.packages = with pkgs;[ 
    swaybg
    wofi
    swaylock-effects
    gnome.zenity
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      monitor=,1920x1080@60,0x0,1

      $lock = echo ig #swaylock --screenshots --clock --effect-blur 5x6
      $pwrdialog = zenity --info --text="Suspend (s), Hibernate(h), Lock(l) or Shutdown (shift+s)"
      $reset = hyprctl dispatch submap reset
      $pwrmode = hyprctl dispatch submap powermgt


      exec=swaybg -i /home/gui/Pictures/swaybg.png &
      exec-once=waybar &

      input {
          kb_layout=us
          kb_variant=intl
          kb_model=
          kb_options=
          kb_rules=

          follow_mouse=1
      }

      general {
          sensitivity=1.0 # for mouse cursor
          main_mod=SUPER

          gaps_in=5
          gaps_out=20
          border_size=2
          col.active_border=0x66ee1111
          col.inactive_border=0x66333333

          apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)

          damage_tracking=full # leave it on full unless you hate your GPU and want to make it suffer
      }

      decoration {
          rounding=5
          blur=1
          blur_size=1 # minimum 1
          blur_passes=2 # minimum 1, more passes = more resource intensive.
          # Your blur "amount" is blur_size * blur_passes, but high blur_size (over around 5-ish) will produce artifacts.
          # if you want heavy blur, you need to up the blur_passes.
          # the more passes, the more you can up the blur_size without noticing artifacts.
          active_opacity=0.82
          inactive_opacity=0.7
      }

      animations {
          enabled=1
          animation=windows,1,7,default
          animation=borders,1,10,default
          animation=fadein,1,10,default
          animation=workspaces,1,6,default
      }

      dwindle {
          pseudotile=0 # enable pseudotiling on dwindle
      }

      misc {
        disable_hyprland_logo=1
      }

      # example window rules
      # for windows named/classed as abc and xyz
      #windowrule=move 69 420,abc
      #windowrule=size 420 69,abc
      #windowrule=tile,xyz
      #windowrule=float,abc
      #windowrule=pseudo,abc
      #windowrule=monitor 0,xyz

      monitor=HDMI-1,1920x1080@60,1920x0,1

      
      submap=powermgt
      
      bind=,s,exec,$reset && $lock & systemctl suspend
      bind=,h,exec,$reset && systemctl hibernate
      bind=,l,exec,$reset && $lock
      bind=SHIFT,s,exec,$reset && shutdown -P now

      bind=,escape,submap,reset

      submap=reset

      bind=ALT,S,exec,$pwrdialog & $pwrmode


      # example binds
      bind=SUPER,RETURN,exec,kitty

      # programs shortcut
      bind=SUPERSHIFT,W,exec,firefox

      bind=SUPERSHIFT,Q,killactive,
      bind=SUPER,M,exit,
      bind=SUPER,E,exec,dolphin
      bind=SUPER,V,togglefloating,
      bind=SUPER,R,exec,wofi --show drun -o DP-3
      bind=SUPER,P,pseudo,

      bind=SUPER,left,movefocus,l
      bind=SUPER,right,movefocus,r
      bind=SUPER,up,movefocus,u
      bind=SUPER,down,movefocus,d

      bind=SUPER,1,workspace,1
      bind=SUPER,2,workspace,2
      bind=SUPER,3,workspace,3
      bind=SUPER,4,workspace,4
      bind=SUPER,5,workspace,5
      bind=SUPER,6,workspace,6
      bind=SUPER,7,workspace,7
      bind=SUPER,8,workspace,8
      bind=SUPER,9,workspace,9
      bind=SUPER,0,workspace,10

      bind=SUPERSHIFT,exclam,movetoworkspace,1
      bind=SUPERSHIFT,at,movetoworkspace,2
      bind=SUPERSHIFT,numbersign,movetoworkspace,3
      bind=SUPERSHIFT,dollar,movetoworkspace,4
      bind=SUPERSHIFT,percent,movetoworkspace,5
      bind=SUPERSHIFT,asciicircum,movetoworkspace,6
      bind=SUPERSHIFT,ampersand,movetoworkspace,7
      bind=SUPERSHIFT,asterisk,movetoworkspace,8
      bind=SUPERSHIFT,parentleft,movetoworkspace,9
      bind=SUPERSHIFT,parentright,movetoworkspace,10'';
  };
}
