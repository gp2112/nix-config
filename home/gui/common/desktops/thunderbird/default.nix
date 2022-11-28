{ pkgs, ... }:

{
  imports = [
    ./accounts.nix
  ];

  programs.thunderbird = {
    enable = true;

    profiles."default" = {
      isDefault = true;
      settings = {};
      withExternalGnupg = true;
    };
  };
}
