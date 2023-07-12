{ pkgs, pkgs-master, ... }:


# Default packages for my desktop computers

{
  imports = [
    ./services
    ./aesthetic.nix
  ];


  home.packages = with pkgs; [
    htop pavucontrol thunderbird
    tdesktop element-desktop
    qbittorrent vlc keepassxc
    discord firefox ungoogled-chromium
    sonixd evince pulseaudio
    ffmpeg libreoffice xdragon
    asciinema neofetch img-cat
    playerctl ghostwriter
    texlive.combined.scheme-tetex
    gummi tor-browser-bundle-bin
    arduino gparted spotify
    gnome-decoder signal-desktop

    (pkgs.writeShellScriptBin "rasptunnel" ''
      ssh -D 8888 gui@home.guip.dev -p 2020
    '')

    (pkgs.writeScriptBin "json-pretify" ''
      #!${pkgs.python3}/bin/python
      import json
      import sys

      def main():
          try:
              fname = sys.argv[1]
              f = open(fname)
          except IndexError:
              f = sys.stdin
          
          data = json.load(f)
          print(json.dumps(data, indent=4))

      if __name__ == '__main__':
          main()
    '')

  ];

}
