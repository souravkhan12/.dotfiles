local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "Raimondi/delimitMate" --auto closing brackets
  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  --airline 
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}  
  -- snippets
    use 'onsails/lspkind-nvim' -- For adding icons to autocompletion
    use 'nvim-tree/nvim-web-devicons' -- For icons across Neovim
  --
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use  
  -- Colorschemes
  use "lunarvim/darkplus.nvim"
  use ('Tsuzat/NeoSolarized.nvim')
  use 'ful1e5/onedark.nvim'
  use 'Mofiqul/vscode.nvim'
  use "projekt0n/github-nvim-theme"
  use 'doums/darcula'
  --Git 
  use "airblade/vim-gitgutter"
  use 'sbdchd/neoformat'
    --Treesitter

  use {
	  "nvim-treesitter/nvim-treesitter",
	  run = ":TSUpdate",
  }
  -- plugin for Comment
  use 'tpope/vim-commentary'
  --Airline themes 
  --LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
	use "p00f/nvim-ts-rainbow"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
