if vim.env.TERM == 'alacritty' then
    vim.cmd[[colorscheme NeoSolarized]]    
else
	vim.cmd 'colorscheme github_dark'
	vim.opt.background = 'dark'
end

vim.cmd [[highlight! link SignColumn LineNr]]
