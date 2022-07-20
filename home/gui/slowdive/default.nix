{ config, pkgs, ... }:

{ imports = [ ../common/desktops ./hyprland ./kitty ];

   
  home.packages = with pkgs; [ 
    cava
  ];
   

}
