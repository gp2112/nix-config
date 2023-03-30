{ pkgs, ... }:

{

  services.xserver = {
    enable = false;

    desktopManager.plasma5 = {
      enable = true;
    };

    displayManager.sddm.enable = true;

    layout = "br";

  };
}
