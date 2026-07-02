return {
  -- Active theme: transparent Nord (the popular Reddit ricing look).
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        transparent = true, -- let the terminal background (Ghostty) show through
        search = { theme = "vim" },
        errors = { mode = "fg" },
        styles = {
          comments = { italic = true },
          keywords = {},
          functions = {},
        },
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme("nord")

      -- Safety net: force transparency on the groups themes sometimes miss,
      -- so floats, sidebars and gutters stay see-through too.
      local clear = { "Normal", "NormalNC", "NormalFloat", "FloatBorder", "SignColumn",
        "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
        "TelescopeNormal", "TelescopeBorder", "TabLineFill", "EndOfBuffer" }
      local function make_transparent()
        for _, g in ipairs(clear) do
          pcall(vim.api.nvim_set_hl, 0, g, { bg = "none" })
        end
      end
      make_transparent()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = make_transparent })
    end,
  },

  -- Alternate themes, kept installed as quick toggles:
  --   dark : :colorscheme tokyonight-night
  --   light: :set background=light | colorscheme melange
  { "folke/tokyonight.nvim", lazy = true, opts = { style = "night" } },
  { "savq/melange-nvim", lazy = true },
}
