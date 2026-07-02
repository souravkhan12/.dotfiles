return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▁" },
        topdelete = { text = "▔" },
        changedelete = { text = "▎" },
      },
      current_line_blame = true, -- GitLens-style inline blame
      current_line_blame_opts = { delay = 400, virt_text_pos = "eol" },
    },
    keys = {
      {
        "]c",
        function()
          require("gitsigns").next_hunk()
        end,
        desc = "Next git hunk",
      },
      {
        "[c",
        function()
          require("gitsigns").prev_hunk()
        end,
        desc = "Prev git hunk",
      },
      {
        "<leader>hs",
        function()
          require("gitsigns").stage_hunk()
        end,
        desc = "Stage hunk",
      },
      {
        "<leader>hu",
        function()
          require("gitsigns").undo_stage_hunk()
        end,
        desc = "Undo stage hunk",
      },
      {
        "<leader>hp",
        function()
          require("gitsigns").preview_hunk_inline()
        end,
        desc = "Preview hunk",
      },
      {
        "<leader>hb",
        function()
          require("gitsigns").blame_line({ full = true })
        end,
        desc = "Blame line (full)",
      },
      {
        "<leader>hB",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
        desc = "Toggle inline blame",
      },
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
      { "<leader>gg", "<cmd>Git<cr>", desc = "Git status (Fugitive)" },
    },
  },

  -- Rich diff & file-history views (GitLens-style)
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff view (working tree)" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current)" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "File history (branch)" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
    },
    opts = {},
  },
}
