{ pkgs, ... }:

{

  services.xserver = {
    enable = false;

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
