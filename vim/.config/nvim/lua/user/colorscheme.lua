if vim.env.TERM == 'alacritty' then
  vim.g.solarized_visibility = 'low'
  vim.opt.background = 'dark'
  vim.cmd [[colorscheme solarized]]
else
	vim.cmd [[colorscheme darkplus]]
	vim.cmd [[let g:airline_theme='onedark']]
end

vim.cmd [[highlight! link SignColumn LineNr]]
