return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{
				"<leader>fc",
				function()
					require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Config Files",
			},
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				opts = {
					pickers = {
						find_files = {
							hidden = true,
						},
					},
				},
				extensions = {
					file_browser = {
						hidden = true,
						auto_depth = true,
						hijack_netrw = true,
					},
				},
			})
			require("telescope").load_extension("file_browser")
		end,
		keys = {
			{
				"<space>E",
				":Telescope file_browser path=%:p:h select_buffer=true<cr>",
				desc = "File Browser (current dir)",
			},
			{
				"<space>e",
				":Telescope file_browser<cr>",
				desc = "File Browser (root dir)",
			},
		},
	},
}
