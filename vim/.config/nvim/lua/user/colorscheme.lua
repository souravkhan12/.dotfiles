if vim.env.TERM == 'alacritty' then
    vim.cmd[[colorscheme NeoSolarized]]    
else
	-- vim.cmd 'colorscheme github_dark'
	vim.cmd 'colorscheme vitesse'
    vim.g.airline_theme = 'gruvbox'
end

vim.cmd [[highlight! link SignColumn LineNr]]
