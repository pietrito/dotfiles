local function show_documentation()
    local filetype = vim.bo.filetype
    if vim.tbl_contains({ 'vim','help' }, filetype) then
        vim.cmd('h '..vim.fn.expand('<cword>'))
    elseif vim.tbl_contains({ 'man' }, filetype) then
        vim.cmd('Man '..vim.fn.expand('<cword>'))
    elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
        require('crates').show_popup()
    else
        vim.lsp.buf.hover()
    end
end

-- Show documentation with 'K'
vim.keymap.set('n', 'K', show_documentation, { silent = true })
-- Toggle NERDtree with '<C-n>'
vim.keymap.set('n', '<C-n>', '<cmd>NERDTreeToggle<CR>')

-- Floaterm: Start a session, open with 't', close with 'ESC'
vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=nvimfloat --height=0.8 --width=0.7 --autoclose=2 <CR> ")
vim.keymap.set('n', "t", ":FloatermToggle nvimfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")

-- Switch between two most recent buffers
-- vim.keymap.set('n', "<leader><leader>", "<c-^>")
-- vim.api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', { noremap = true, silent = true })

-- TODO comments (jump to next/previous todo)
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Persistence: restore the session for the current directory
vim.keymap.set("n", "<leader>qs", '<cmd>lua require("persistence").load()<cr>')
-- Persistence: restore the last session
vim.keymap.set("n", "<leader>ml", '<cmd>lua require("persistence").load({ last = true })<cr>')
-- Persistence: stop => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", '<cmd>lua require("persistence").stop()<cr>')

local M = {}

-- Disable bad default mappings
M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["K"] = ""
  }
}
--[[
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

M.telescope = {
  i = {
    ["<c-t>"] = trouble.open_with_trouble
  },
  n = {
    [';'] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<c-t>"] = trouble.open_with_trouble
  }
} ]]
M.telescope = {
  n = {
    [';'] = { "<cmd> Telescope find_files <CR>", "Find files" },
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

return M

