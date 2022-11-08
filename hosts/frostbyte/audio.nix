{ pkgs, ... }:

{

  users.users.gui.extraGroups = [ "jackaudio" ];


  # Enable pipewire sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;

  };

  services.jack = {
    jackd.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  environment.systemPackages = with pkgs; [ libjack2 jack2 qjackctl jack_capture ];


}
