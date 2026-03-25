local M = {}

function M.setup()
  local opt = vim.opt

  opt.number = true
  opt.relativenumber = true
  opt.signcolumn = "yes"
  opt.cursorline = true
  opt.scrolloff = 8
  opt.sidescrolloff = 8

  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.expandtab = true
  opt.smartindent = true

  opt.wrap = false
  opt.breakindent = true

  opt.ignorecase = true
  opt.smartcase = true

  opt.splitbelow = true
  opt.splitright = true

  opt.undofile = true
  opt.swapfile = false
  opt.backup = false

  opt.clipboard:append("unnamedplus")
  opt.termguicolors = true
  opt.timeoutlen = 300
  opt.updatetime = 250

  opt.list = true
  opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

  opt.confirm = true
  opt.mouse = "a"
  opt.completeopt = { "menu", "menuone", "noselect" }
end

return M
