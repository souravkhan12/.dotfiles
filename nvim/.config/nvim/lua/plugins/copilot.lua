return {
  -- GitHub Copilot. Inline ghost-text is disabled so suggestions flow through
  -- the same nvim-cmp popup as LSP/snippets (see cmp.lua). First-time setup:
  --   :Copilot auth   (opens a GitHub device-login in your browser)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      -- nvm's `node` is v20 (< 22, which copilot.lua requires) and the nvm
      -- shell function isn't available to Neovim's vim.system. Pin to the
      -- homebrew node (v26) so version detection is independent of PATH/nvm.
      copilot_node_command = "/opt/homebrew/bin/node",
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        ["*"] = true,
        markdown = true,
        gitcommit = true,
      },
    },
  },

  -- Bridges Copilot into nvim-cmp as a completion source.
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
