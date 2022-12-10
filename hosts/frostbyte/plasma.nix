{ pkgs, ... }:

{

  services.xserver = {
    enable = false;

    desktopManager.plasma5 = {
      enable = true;
    };
    layout = "br";

    gdm = {
      enable = true;
      wayland = true;
    };
  };
}
