-- Remove trailing spaces just before writting files
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]
-- Format code on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
