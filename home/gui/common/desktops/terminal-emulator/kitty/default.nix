{ config, pkgs, ... }:


{
  programs.kitty = {
    enable = true;
    # font.name = "CaskaydiaCove NF";
    settings = {
      font_family = "CaskaydiaCove NF";
      adjust_column_width = -5;
    };
  };
}
