{ lib, pkgs, ... }:

{ imports = [
    ../common
    ../common/desktops/minimum.nix
    ../common/desktops/desktop-env/plasma
  ];

  home.packages = with pkgs; [
    libsForQt5.kcalc
    dbeaver
    php mysql80 phpactor
  ];

  programs.git.extraConfig.user = {
    name = lib.mkForce "Guilherme Ramos Costa Paixao";
    email = lib.mkForce "guircp@usp.br";
  };

}
