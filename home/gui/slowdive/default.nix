{ config, pkgs, ... }:

{ imports = [ ../common ../common/desktops ./sway]; #./hyprland ./kitty ];

   
  home.packages = with pkgs; [ 
    cava
  ];
   

}
