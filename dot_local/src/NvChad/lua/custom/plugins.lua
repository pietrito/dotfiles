local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",

    opts = {
      ensure_installed = {
        "rust-analyzer"
      }
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
      vim.g.rustfmt_emit_files = 1
			vim.g.rustfmt_fail_silently = 0
			vim.g.rust_clip_command = 'wl-copy'
      -- vim.g.rustfmt_options = '--edition 2021'
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- useful
        "json",

        -- dev
        "rust",
        "python",
      },
    }
  },

  {
    "saecki/crates.nvim",
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "preservim/nerdtree",
    lazy = false
  },
  {
    "Xuyuanp/nerdtree-git-plugin",
    lazy = false
  },
  {
    "voldikss/vim-floaterm",
    lazy = false
  },
  {
     "iamcco/markdown-preview.nvim",
     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
ft = { "markdown" },
     build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
    -- add any custom options here
    }
  },
  {
    "tpope/vim-fugitive",
    lazy = false
  },
  {
    "folke/trouble.nvim",
    lazy = false
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = false
  },
  --[[ {
    "LunarVim/breadcrumbs.nvim",
    dependencies = { "SmiteshP/nvim-navic" },
    config = function()
      require("nvim-navic").setup {
        lsp = {
            auto_attach = true,
        },
      }

      require("breadcrumbs").setup()
    end,

    lazy = false
  }, ]]
  {
    "catppuccin/nvim",
    name = "catppuccin",
    flavour = "mocha"
  }
}

return plugins
