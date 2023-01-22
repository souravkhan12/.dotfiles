local status_ok, configs = pcall(require,"nvim-treesitter.configs")
if not status_ok then 
	return
end

configs.setup{
	ensure_installed = 'all',
    highlight = { enable = true, additional_vim_regex_highlighting = true },
    --indent = { enable = true },
}
local treesitter_parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
