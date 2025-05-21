local Plugins = {
  {'rhysd/clever-f.vim'}, -- Better Find
  {'wellle/targets.vim'},
  {'tpope/vim-repeat'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-surround'},
  {'kyazdani42/nvim-web-devicons', lazy = true},
  {'numToStr/Comment.nvim', config = true, event = 'VeryLazy'},
  -- {'nvim-treesitter/nvim-treesitter'},
  -- {'nvim-telescope/telescope.nvim', branch = '0.1.x'},
  -- {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  -- {'neovim/nvim-lspconfig'},
  -- {'hrsh7th/nvim-cmp'},
  -- {'hrsh7th/cmp-nvim-lsp'},
  -- {'williamboman/mason.nvim'},
  {'lervag/vimtex', ft = 'tex'}, -- LaTeX Plugins, lazy-loaded for tex files

  -- Themes
  {'folke/tokyonight.nvim'},
  {'joshdick/onedark.vim'},
  {'tanvirtin/monokai.nvim'},
  {'lunarvim/darkplus.nvim'},
}

return Plugins
