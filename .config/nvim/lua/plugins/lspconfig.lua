return {
	{
		"williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
        border = "rounded"
      }
    },
    keys = {
      { "<leader>m", "<cmd>:Mason<cr>", desc = "Open Mason" }
    }
  },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "tailwindcss" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
    dependencies = {"ms-jpq/coq_nvim"},
		opts = {
      servers = {
        tsserver = {
          keys = {
            {"<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports"},
            {"<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File"}
          }
        }
      }
    },
    config = function()
			local lspconfig = require("lspconfig")
			local coq = require("coq")

			lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({}))
			lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({}))
			lspconfig.tailwindcss.setup(coq.lsp_ensure_capabilities({}))

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Goto type definition" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto references" })
		end,
	},
}
