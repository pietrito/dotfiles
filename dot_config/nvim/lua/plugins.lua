-- This file is loaded using `require('plugins')` in `init.lua`.

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Project navigation
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}}
    use 'nvim-tree/nvim-web-devicons'

    -- ?
    use 'nvim-treesitter/nvim-treesitter'

    -- LSP support
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    -- rust-analyzer progress animation
    use { 'j-hui/fidget.nvim', tag = 'legacy' }

    -- Completion framework:
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    -- use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    -- Transparent background
    use 'xiyaowong/transparent.nvim'

    -- File layout
    use 'preservim/tagbar'

    -- Autopair brackets and stuff
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Easy Comment/Uncomment
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- THEMES
    use 'navarasu/onedark.nvim'
    use 'rebelot/kanagawa.nvim'
    use 'sainnhe/everforest'
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Speed up plugins loading
    use 'lewis6991/impatient.nvim'

    -- Bottom status line
    use 'itchyny/lightline.vim'

    use 'rust-lang/rust.vim'

    use 'tpope/vim-surround' -- Add "", '', (),
    -- use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'

    -- Adds support for pretty TODO
    use {"folke/trouble.nvim", requires = { "nvim-tree/nvim-web-devicons" }}
    use { "folke/todo-comments.nvim", requires = {"nvim-lua/plenary.nvim"}}

    use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
    end
   }

    -- NERDTree
    use 'preservim/nerdtree'
    use 'ryanoasis/vim-devicons'
    use 'Xuyuanp/nerdtree-git-plugin'
    -- use 'tiagofumo/vim-nerdtree-syntax-highlight'


    -- Wakatime
    -- use 'wakatime/vim-wakatime'
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
end)

