{ pkgs, ... }:

{

  services.xserver = {
    enable = true;

    desktopManager.plasma5 = {
      enable = true;
    };
    layout = "br";

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
