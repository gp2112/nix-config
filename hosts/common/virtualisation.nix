{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ virt-manager cpio ];

  virtualisation = {
    libvirtd.enable = true;
    virtualbox.host.enable = true;
  };
  users.groups.libvirtd.members = [ "gui" ];
}
