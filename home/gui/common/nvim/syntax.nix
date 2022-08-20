{ pkgs, config, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    rust-vim
    vim-markdown
    vim-nix
    vim-toml
  ];
}
