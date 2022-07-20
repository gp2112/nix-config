{ config, pkgs, ... }:


{
  programs.starship = {
    enable = true;

    settings = {
      python.symbol = " ";
      golang.symbol = " ";
      java.symbol = " ";
      nodejs.symbol = " ";
      nix_shell.symbol = "  ";
      ruby.symbol = " ";
      rust.symbol = " ";
      lua.symbol = " ";
      package.symbol = " ";

      sudo = {
        symbol = "  ";
        disabled = false;
      };

      battery.display = [
        {
          threshold = 10;
          charging_symbol = " ";
          discharging_symbol = " ";
          style = "bold red";
        }
    ];


    };
  };
}
