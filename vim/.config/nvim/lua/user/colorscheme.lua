if vim.env.TERM == 'alacritty' then
  vim.opt.background = 'dark'
  vim.cmd [[colorscheme solarized]]
else
	vim.o.termguicolors = true
	vim.cmd 'colorscheme vscode'
	vim.cmd [[let g:airline_theme='onedark']]
	vim.opt.background = 'dark'
end

vim.cmd [[highlight! link SignColumn LineNr]]
