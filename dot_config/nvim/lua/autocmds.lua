-- Remove trailing spaces just before writting files
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

