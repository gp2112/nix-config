{ config, pkgs, ... }:

{ imports = [ 
  ../common 
  ../common/desktops
  ./swayconf.nix
];

  home.packages = with pkgs; [ 
    brightnessctl # screen brightness controll
  ];

}
