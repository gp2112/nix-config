{ config, pkgs, ... }:

{ imports = [ ../common/desktops  ];

   
  home.packages = with pkgs; [ 
    cava
  ];
   

}
