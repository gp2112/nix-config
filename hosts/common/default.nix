{ config, pkgs, ... }:

{
  imports = [ ./users.nix ];

  nix.package = pkgs.nixUnstable;
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
  };

  # dns servers
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  time.timeZone = "America/Sao_Paulo";

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
  ];


}
