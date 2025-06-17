if vim.env.TERM == 'alacritty' then
    vim.cmd[[colorscheme NeoSolarized]]    
else
	vim.cmd 'colorscheme vscode'
	vim.cmd [[let g:airline_theme='onedark']]
	vim.opt.background = 'dark'
end

vim.cmd [[highlight! link SignColumn LineNr]]
