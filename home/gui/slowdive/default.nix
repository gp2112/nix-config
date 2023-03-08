{ config, pkgs, ... }:

{ imports = [ 
  ../common 
  ../common/desktops
  ../common/desktops/multimidia
  ../common/desktops/services/kdeconnect.nix
  ./swayconf.nix
];

  home.packages = with pkgs; [
    brightnessctl # screen brightness controll
    xfce.thunar
    gnome.eog
    pantheon.elementary-calculator
  ];

}
