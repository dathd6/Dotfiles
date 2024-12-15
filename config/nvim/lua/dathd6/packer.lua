-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'sainnhe/gruvbox-material',
	  lazy = false,
	  priority = 1000,
	  config = function()
		  -- Optionally configure and load the colorscheme
		  -- directly inside the plugin declaration.
		  vim.g.gruvbox_material_enable_italic = true
		  vim.g.gruvbox_material_foreground = 'mix'
		  vim.cmd.colorscheme('gruvbox-material')
	  end
  }

  use { 
	  'nvim-treesitter/nvim-treesitter',
	  { run = ':TSUpdate' }
  }

  use { 'nvim-treesitter/playground' }

  use { 'mbbill/undotree' }

  use { 'tpope/vim-fugitive' }

  use({'VonHeikemen/lsp-zero.nvim'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})

  use {
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
	  "neovim/nvim-lspconfig",
  }

  use { 'norcalli/nvim-colorizer.lua' }

  use { 'theprimeagen/harpoon' }

  use {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
      -- use opts = {} for passing setup options
      -- this is equivalent to setup({}) function
  }

end)
