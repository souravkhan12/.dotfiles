local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("user-highlight-yank", { clear = true })
autocmd("TextYankPost", {
  group = "user-highlight-yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 80 })
  end,
})

augroup("user-restore-cursor", { clear = true })
autocmd("BufReadPost", {
  group = "user-restore-cursor",
  pattern = "*",
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    if row > 0 and row <= vim.api.nvim_buf_line_count(0) then
      pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
    end
  end,
})
