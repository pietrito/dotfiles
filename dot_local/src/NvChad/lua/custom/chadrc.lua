---@type ChadrcConfig

local M = {}

M.ui = {
  -- Theme
  theme = 'doomchad',

  -- Dashboard page
  nvdash = {
    load_on_startup = true,
    header = {
       " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
       " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
       " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
       " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
       " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
       " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    },

    buttons = {
        { "  Find File", "Spc f f", "Telescope find_files" },
        { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
        { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
        { "  Restore Session", "Spc m s", "<cmd>lua require('persistence').load()<cr>" },
        { "  Bookmarks", "Spc m a", "Telescope marks" },
        { "  Themes", "Spc t h", "Telescope themes" },
        { "  Mappings", "Spc c h", "NvCheatsheet" },
    }
  },

  -- Disable tabufline
  tabufline = {
    enabled = false
  },

  -- Highlight overrides
  hl_override = {
    Comment = {
      fg = "#10B981",
      -- fg = "#8CF8F7",
      italic = true,
      bold = true,
    },
    ["@comment"] = {
      link = "Comment"
    }
  },

  -- Status line configuration
  statusline = {
    theme = "minimal",
    -- lualine_c = {{'filename', path = 2}}, -- Set path = 2 for absolute path
  }

}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"



return M
