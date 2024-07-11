-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('github/copilot.vim')
  use('rose-pine/neovim')
  use('folke/tokyonight.nvim')
  use('rebelot/kanagawa.nvim')
  use ('EdenEast/nightfox.nvim') 
  use { "catppuccin/nvim", as = "catppuccin" }

  -- install without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
  }
  use('andweeb/presence.nvim')
  use('norcalli/nvim-colorizer.lua')
  use('EtiamNullam/deferred-clipboard.nvim')
  use {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper'
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }
  use('nvim-tree/nvim-tree.lua')
  use('vim-airline/vim-airline')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  } 
end)
