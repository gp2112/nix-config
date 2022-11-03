{ config, pkgs, ... }:

{

  programs.waybar.style = ''
        * {
          font-size: 12pt;
          padding: 0 8px;
        }
        .modules-right {
          margin-right: -15;
        }
        .modules-left {
          margin-left: -15;
        }
        window#waybar.top {
          color: #FFF0F0;
          background-color: rgba(100, 100, 100, 0.4);
          border: 2px solid #0000CC;
          padding: 0;
          border-radius: 10px;
        }
        window#waybar.bottom {
          color: #000055;
          background-color: rgba(100, 100, 100, 0.4);
          border: 2px solid #4040CC;
          opacity: 0.90;
          border-radius: 10px;
        }
        #workspaces button {
          background-color: rgba(10, 75, 100, 0.4);
          color: #FFF0F0;
          margin: 4px;
        }
        #workspaces button.hidden {
          background-color: #000000;
          color: #FFF0F0;
        }
        #workspaces button.focused,
        #workspaces button.active {
          background-color: #0000AA;
          color: #FFF0F0;

        }
        #clock {
          background-color: rgba(0, 0, 100, 0.4);
          color: #F0F0F1;
          padding-left: 15px;
          padding-right: 15px;
          margin-top: 0;
          margin-bottom: 0;
          border-radius: 10px;
        }
        #custom-menu {
          background-color: #0000CC;
          color: #000000;
          padding-left: 15px;
          padding-right: 22px;
          margin-left: 0;
          margin-right: 10px;
          margin-top: 0;
          margin-bottom: 0;
          border-radius: 10px;
        }
        #custom-hostname {
          background-color: #0000CC;
          color: #000000;
          padding-left: 15px;
          padding-right: 18px;
          margin-right: 0;
          margin-top: 0;
          margin-bottom: 0;
          border-radius: 10px;
        }
    '';
}
