{ config, pkgs, ... }:

{ imports = [ ../common ../common/desktops ./hyprland ./kitty ];

   
  home.packages = with pkgs; [ 
    cava
  ];
   

}
