{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;

    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      https-everywhere
      
    ];

    profiles.default = {
      isDefault = true;
      name = "gui-default";
          
  

    };

  };
}
