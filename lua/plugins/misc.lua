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

	-- Obsidian integration
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "tome",
					path = "~/tome",
				},
			},
			ui = {
				enable = false,
			},

			---@return table
			note_frontmatter_func = function(note)
				local out = { tags = note.tags }

				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,
		},

		vim.keymap.set("n", "<leader>oo", vim.cmd.ObsidianOpen),
		vim.keymap.set("n", "<leader>ot", vim.cmd.ObsidianTags),
	},
}
