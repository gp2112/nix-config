{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ virt-manager cpio ];

  virtualisation.libvirtd.enable = true;
  users.groups.libvirtd.members = [ "gui" ];

}
