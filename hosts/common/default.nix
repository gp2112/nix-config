{ config, pkgs, ... }:

{
  imports = [
    ./users.nix
    ./nix.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
  };

  time.timeZone = "America/Sao_Paulo";

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
  ];


  environment.enableAllTerminfo = true;

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

}
