local set = vim.opt

--{{{
-- set.nocompatible = true
--}}}

--{{{ Appearence
set.updatetime = 300
set.conceallevel = 0
set.listchars = "tab:▸\\,trail:-,precedes:←,extends:→"
set.colorcolumn = "100"
--}}}

--{{{ Navigation
set.splitright = true
set.splitbelow = true
--}}}

--{{{ Edition
set.tabstop = 8
set.softtabstop = 0
set.expandtab = true
set.shiftwidth = 2
set.smarttab = true
set.scrolloff=10
--}}}

--{{{ Case insensitive search
set.ignorecase = true
set.smartcase = true
--}}}


--{{{ VIM Specific
set.encoding = "utf-8"
set.number = true
set.relativenumber = true
--}}}

-- RustFmt on file save
vim.g['rustfmt_autosave'] = true

-- LSP Diagnostics Options Setup
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

