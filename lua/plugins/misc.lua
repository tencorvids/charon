return {
	-- Comment
	{
		"numToStr/Comment.nvim",
		enabled = true,
		opts = {},
		lazy = false,
	},

	-- Jump to search
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				search = {
					enabled = true,
				},
			},
		},
	},

	-- Marks
	{
		"cbochs/grapple.nvim",
		opts = {
			scope = "git",
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{ "<leader>M", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
			{ "<leader>m", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
		},
	},

	-- Undo tree tui
	{
		"mbbill/undotree",

		vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle),
	},
}
