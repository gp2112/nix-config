{ pkgs, ... }:

{
  imports = [
    ./documents
  ];

  home.packages = with pkgs; [
    htop pavucontrol thunderbird
    vlc keepassxc
    firefox ungoogled-chromium
    pulseaudio tdesktop
    ffmpeg xdragon
    neofetch gparted spotify

    (pkgs.writeShellScriptBin "rasptunnel" ''
      ssh -d 8888 gui@home.guip.dev -p 2020
    '')

    json-prettify
  ];
}
