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
      aws.disabled = true;
      perl.disabled = true;

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

      custom = {
        prolog = {
          detect_extensions = [ "pl" ];
          symbol = " ";
          description = "Prolog language.";
          #command = "swipl --version | grep -E '[0-9]*\.[0-9]*\.[0-9]*' -o";
        };

      };


    };
  };
}
