if vim.env.TERM == 'rxvt' or vim.env.TERM == 'termite' or vim.env.TERM == 'alacritty' then
  vim.g.solarized_visibility = 'low'
  vim.opt.background = 'dark'
  vim.cmd [[colorscheme solarized]]
else
	--vim.cmd [[colorscheme darkplus]]
	vim.cmd [[colorscheme gruvbox]]
	vim.cmd [[let g:airline_theme='gruvbox']]
end

vim.cmd [[highlight! link SignColumn LineNr]]
