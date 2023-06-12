# When you add custom packages, list them here
{ pkgs }: {
  netkit = pkgs.callPackage ./netkit { };
}
