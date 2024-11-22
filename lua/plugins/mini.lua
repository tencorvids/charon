-- Mini plugins
return {
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

		-- Base16 theming
		require("mini.base16").setup({
			palette = {
				base00 = "#000000", -- Default Background
				base01 = "#121212", -- Lighter Background
				base02 = "#222222", -- Selection Background
				base03 = "#333333", -- Comments, Invisibles, Line Highlighting
				base04 = "#999999", -- Dark Foreground (Used for status bars)
				base05 = "#c1c1c1", -- Default Foreground
				base06 = "#999999", -- Light Foreground (Not often used)
				base07 = "#c1c1c1", -- Light Background (Not often used)
				base08 = "#5f8787", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
				base09 = "#aaaaaa", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
				base0A = "#974b46", -- Classes, Markup Bold, Search Text Background
				base0B = "#eceee3", -- Strings, Inherited Class, Markup Code, Diff Inserted
				base0C = "#aaaaaa", -- Support, Regular Expressions, Escape Characters, Markup Quotes
				base0D = "#888888", -- Functions, Methods, Attribute IDs, Headings
				base0E = "#999999", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
				base0F = "#444444", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
			},
			use_cterm = false, -- Set to true if you want to use cterm colors for terminal applications
		})
	end,
}
