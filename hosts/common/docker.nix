{ pkgs, ... }:

{
  virtualization.docker = {
    enable = true;
    rootless.enable = true;
  };
}
