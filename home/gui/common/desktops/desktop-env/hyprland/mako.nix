{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    anchor = "top-right";
    borderRadius = 3;
    defaultTimeout = 1;
  };
}
