{ config, pkgs, ... }:

{ imports = [
    
];

  home.packages = with pkgs; [ 
    steam
    wine-staging
    lutris
    openjdk16-bootstrap
    polymc
  ];


}

