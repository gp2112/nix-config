{ config, pkgs, ... }:
{
  imports = [
    ./lsp.nix
    ./syntax.nix
  ];
  programs.neovim = {
    enable = true;
    extraConfig = ''
        set nocompatible
        set showmatch
        set ignorecase
        set mouse=a
        set hlsearch
        set incsearch
        set tabstop=4
        set softtabstop=4
        set expandtab
        set shiftwidth=4
        set autoindent
        set number
        set wildmode=longest,list
        set cc=80
        filetype plugin indent on
        syntax on
        set mouse=a
        set clipboard+=unnamedplus
        filetype plugin on
        set cursorline
        set ttyfast
        set spell
        set noswapfile
        colorscheme terafox
        set conceallevel=2
        map <C-n> :NERDTreeToggle<CR>
        '';


  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    nightfox-nvim
    nerdcommenter
    vim-surround
    nerdtree
    nvim-autopairs
    fugitive
  ];

  defaultEditor = true;

 };

}
