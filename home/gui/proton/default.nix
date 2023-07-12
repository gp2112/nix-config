{ lib, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops
    ../common/desktops/desktop-env/plasma
  ];

  home.packages = with pkgs; [
    libsForQt5.kcalc
    mysql-workbench
    php mysql80 phpactor
  ];

  programs.git.extraConfig.user = {
    name = lib.mkForce "Guilherme Ramos Costa Paixao";
    email = lib.mkForce "guircp@usp.br";
  };

}
