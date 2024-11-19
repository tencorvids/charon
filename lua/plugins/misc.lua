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

	-- Mini plugins
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- Examples:
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Create pairs of brackets, quotes, etc.
			require("mini.pairs").setup()
		end,
	},

	-- Undo tree tui
	{
		"mbbill/undotree",

		vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle),
	},
}
