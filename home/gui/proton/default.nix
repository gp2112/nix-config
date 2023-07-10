{ config, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops
    ../common/desktops/desktop-env/plasma
  ];

  home.packages = with pkgs; [
    libsForQt5.kcalc
    mysql-workbench
    php mysql80
  ];

}
