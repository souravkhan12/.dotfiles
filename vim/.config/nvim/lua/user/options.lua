local options = {
      backup = false,                          -- creates a backup file
      clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
      cmdheight = 1,                           -- more space in the neovim command line for displaying messages
      completeopt = { "menuone", "noselect" }, -- mostly just for cmp
      conceallevel = 0,                        -- so that `` is visible in markdown files
      fileencoding = "utf-8",                  -- the encoding written to a file
      hlsearch = true,                         -- highlight all matches on previous search pattern
      ignorecase = true,                       -- ignore case in search patterns
      mouse = "a",                             -- allow the mouse to be used in neovim
      pumheight = 10,                          -- pop up menu height
      showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
      showtabline = 0,                         -- always show tabs
      smartcase = true,                        -- smart case
      smartindent = true,                      -- make indenting smarter again
      splitbelow = true,                       -- force all horizontal splits to go below current window
      splitright = true,                       -- force all vertical splits to go to the right of current window
      swapfile = false,                        -- creates a swapfile
      timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
      undofile = true,                         -- enable persistent undo
      updatetime = 100,                       -- faster completion (4000ms default)
      writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
      expandtab = true,                        -- convert tabs to spaces
      wrap=false;
      shiftwidth = 4,                          -- the number of spaces inserted for each indentation
      tabstop = 4,                             -- insert 2 spaces for a tab
      number = true,                           -- set numbered lines
      laststatus = 3,
      showcmd = false,
      ruler = false,
      relativenumber = false,                   -- set relative numbered lines
      numberwidth = 4,                         -- set number column width to 2 {default 4}
      signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
      scrolloff = 8,                           -- is one of my fav
      sidescrolloff = 8,
      title = true,
      foldmethod = "syntax" -- folding set to "expr" for treesitter based folding
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.delimitMate_expand_cr = 1
vim.g.airline_powerline_fonts = 1
vim.cmd [[autocmd FileType apache setlocal commentstring=#\ %s]]
