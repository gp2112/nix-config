{ config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font.normal = {
        family = "FuraCode Nerd Font Mono:style=Medium,Regular";
        style = "Regular";
      };
    };
  };
}
