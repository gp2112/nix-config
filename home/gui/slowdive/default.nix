{ config, pkgs, ... }:

{ imports = [ 
  ../common 
  ../common/desktops
  ../common/desktops/services/kdeconnect.nix
  ./swayconf.nix
];

  home.packages = with pkgs; [ 
    brightnessctl # screen brightness controll
  ];

}
