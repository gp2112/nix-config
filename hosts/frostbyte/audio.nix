{ pkgs, ... }:

{

  users.users.gui.extraGroups = [ "jackaudio" ];


  # Enable pipewire sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [ libjack2 jack2 qjackctl ];
}
