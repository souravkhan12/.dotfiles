vim.api.nvim_command([[
autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/skeleton.cpp
]])

vim.api.nvim_command([[
autocmd BufNewFile *.cc 0r ~/.config/nvim/templates/skeleton.cc
]])

vim.api.nvim_command([[
autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
]])

--Buffer
vim.api.nvim_command([[
autocmd BufNewFile *.c 0r ~/.config/nvim/templates/skeleton.c
]])
--lspSaga

vim.api.nvim_command([[
au BufNewFile,BufRead *.ejs set filetype=html
]])

vim.api.nvim_command([[
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
]])


vim.api.nvim_command([[
autocmd BufEnter NERD_tree_* | execute 'normal R'
]])
vim.api.nvim_command([[
let NERDTreeShowHidden = 1
]])
