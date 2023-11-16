local opt = vim.opt

-- Highlight the 100th column
opt.colorcolumn = "100"
-- Always keep 10 lines of code below/above the cursor.
opt.scrolloff=10

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

-- Remove trailing spaces just before writting files
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- Show diagnostics window
vim.cmd [[ autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false }) ]]

-- Start NERDTree when Vim starts with a directory argument.
vim.cmd [[ autocmd StdinReadPre * let s:std_in=1 ]]
vim.cmd [[ autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | execute 'Nvdash' | endif ]]
-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.cmd [[ autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif ]]
-- vim.cmd [[ autocmd VimEnter * if execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif ]]
-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
vim.cmd [[ autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif ]]
