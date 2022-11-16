{ pkgs, ... }:

{
  imports = [
    ../../wayland
  ];

  home.packages = with pkgs; [
    layan-kde
  ];

}
