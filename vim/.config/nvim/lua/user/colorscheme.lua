if vim.env.TERM == 'alacritty' then
    vim.cmd[[colorscheme NeoSolarized]]    
else
	vim.cmd 'colorscheme github_dark'
	-- vim.cmd 'colorscheme vitesse'
end

vim.cmd [[highlight! link SignColumn LineNr]]
