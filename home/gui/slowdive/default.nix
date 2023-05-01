{ config, pkgs, ... }:

{ imports = [ 
  ../common
  ../common/desktops
  ../common/desktops/multimidia
  ../common/desktops/services/kdeconnect.nix
  # ./swayconf.nix
  ../common/desktops/desktop-env/hyprland
];

  home.packages = with pkgs; [
    brightnessctl # screen brightness controll
    xfce.thunar
    gnome.eog
    pantheon.elementary-calculator
    calcurse
  ];

}
