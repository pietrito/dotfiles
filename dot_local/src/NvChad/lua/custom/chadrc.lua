---@type ChadrcConfig

local M = {}

M.ui = {
  -- Theme
  theme = 'monekai',

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
    }
  },

  -- Disable tabufline
  tabufline = {
    enabled = false
  }
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"



return M
