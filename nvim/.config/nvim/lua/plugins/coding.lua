return {
  -- Auto close & auto rename JSX/HTML tags (VS Code "Auto Rename Tag")
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- Highlight & search TODO / FIXME / NOTE (VS Code "Better Comments" + "Todo Tree")
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = true },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev todo comment" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todos (Trouble)" },
    },
  },

  -- Inline color previews for #hex / rgb() / tailwind (VS Code "Color Highlight")
  {
    "catgoose/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      user_default_options = {
        css = true,
        tailwind = true,
        names = false, -- don't colorize the word "red" etc.
      },
    },
  },

  -- Rainbow bracket pairs (VS Code "Bracket Pair Colorizer")
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Human-readable TypeScript errors (VS Code "Pretty TS Errors")
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {},
  },
}
