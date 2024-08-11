vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- this mf is f*cking awesome
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- tressitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- ricing
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup()
    end,
  })
 --colorschemes
  use('rose-pine/neovim')
  use('folke/tokyonight.nvim')
  use('rebelot/kanagawa.nvim')
  use('EdenEast/nightfox.nvim') 
  use{ "catppuccin/nvim", as = "catppuccin" }
  use('bluz71/vim-moonfly-colors')

  use {
    "folke/noice.nvim",
    requires = {
      { "MunifTanjim/nui.nvim" },
    }
  }

  ----------------------------

  -- fine plugin I do not use at all
  use('ThePrimeagen/harpoon')

  -- perfect undotree
  use('mbbill/undotree')

  -- idc
  use('tpope/vim-fugitive')



  -- shit
  use({
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  })

  -- dap
  use('mfussenegger/nvim-dap')

  -- conjure
  use{'Olical/conjure'}

  -- tmux-vim
  use('christoomey/vim-tmux-navigator')

  -- install md-preview without yarn or npm
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

  --clipboard shit 
  use('EtiamNullam/deferred-clipboard.nvim')

  -- actually useless, kindof a bloatware
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

  -- paredit for lisp
  use('julienvincent/nvim-paredit')

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
