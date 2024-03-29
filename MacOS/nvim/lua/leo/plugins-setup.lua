local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- lua functions that many plugins use
  use "nvim-lua/plenary.nvim"

  -- preferred colorscheme
  use 'bluz71/vim-nightfly-colors'
  use "ellisonleao/gruvbox.nvim"
  use 'shaunsingh/nord.nvim'

  use "christoomey/vim-tmux-navigator" -- tmux & split window navigation
  
  use "szw/vim-maximizer" -- maximizes and restores current window

  -- essential plugins
  use "tpope/vim-surround"
  use "vim-scripts/ReplaceWithRegister"

  -- comment with gc
  use "numToStr/Comment.nvim"

  -- file explorer
  use "nvim-tree/nvim-tree.lua"

  --icons
  use "kyazdani42/nvim-web-devicons"

  -- status line
  use "nvim-lualine/lualine.nvim"

  -- fuzzy finding
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- autocompletion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "saadparwaiz1/cmp_luasnip" -- for autocompletion
  use "rafamadriz/friendly-snippets" -- useful snippets

  -- managing & installing lsp servers
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- configuring lsp servers
  use "neovim/nvim-lspconfig"
  
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  use "jose-elias-alvarez/null-ls.nvim"
  use "jayp0521/mason-null-ls.nvim"

  -- git signs plugin
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

