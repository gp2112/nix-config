{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
  };
}
