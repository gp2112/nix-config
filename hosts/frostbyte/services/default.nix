{ pkgs, ... }:

{
  imports = [
    ./i2p.nix
    ../../common/minecraft.nix
  ];
}
