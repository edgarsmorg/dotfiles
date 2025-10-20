return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
			{ "<leader>sf", "<cmd>Telescope find_files hidden=true<CR>", desc = "[S]earch [F]iles" },
			{ "<leader><leader>", "<cmd>Telescope buffers<CR>", desc = "[  ] Find existingsbuffers" },
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
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })

			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<leader>ie", "<cmd>IconPickerNormal<CR>", { desc = "[I]nsert [E]moji" })
			vim.keymap.set("n", "<leader>ye", "<cmd>IconPickerYank<CR>", { desc = "[Y]ank [E]moji" })
		end,
	},
}
