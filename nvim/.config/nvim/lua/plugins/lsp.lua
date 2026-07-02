return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonLog" },
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason installer" } },
    opts = {
      ui = { border = "rounded" },
      PATH = "prepend",
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "prettier",
          "shfmt",
        },
        auto_update = false,
        run_on_start = true,
        start_delay = 3000,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
      },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- ── Default config applied to every server (mason-lspconfig v2 enables
      --    servers via vim.lsp.enable(); `handlers=` no longer exists) ──────
      local caps = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = caps })

      -- Per-server overrides
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                "${3rd}/luv/library",
              },
            },
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "eslint",
          "html",
          "cssls",
          "jsonls",
          "emmet_language_server",
          "pyright",
          "rust_analyzer",
          "bashls",
          "yamlls",
        },
        automatic_enable = true, -- auto vim.lsp.enable() installed servers
      })

      -- ── Keymaps / diagnostics on attach ────────────────────────────────
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(args)
          local buf = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "Goto definition")
          map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
          map("n", "K", vim.lsp.buf.hover, "Hover docs")
          map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
          map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code action")

          map("n", "gr", function()
            require("telescope.builtin").lsp_references()
          end, "References (picker)")

          map("n", "<leader>ls", function()
            require("telescope.builtin").lsp_document_symbols()
          end, "Symbols (buffer)")

          map("n", "<leader>lS", function()
            require("telescope.builtin").lsp_dynamic_workspace_symbols()
          end, "Symbols (workspace)")

          if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map("n", "<leader>lh", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
            end, "Toggle inlay hints")
          end
        end,
      })

      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        float = { border = "rounded", source = true },
        -- `jump.float = true` was deprecated in 0.12; on_jump is the replacement.
        -- This mirrors the old float behavior and becomes the default for jump().
        jump = {
          on_jump = function(_, bufnr)
            vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor", focus = false })
          end,
        },
      })

      vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1 })
      end, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1 })
      end, { desc = "Next diagnostic" })
      vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Diagnostic float" })
    end,
  },
}
