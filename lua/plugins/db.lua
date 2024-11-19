return {
	{
		-- Dadbod
		"tpope/vim-dadbod",
	},

	{
		-- Dadbox ui
		"kristijanhusak/vim-dadbod-ui",
	},

	{
		-- Dadbox completion
		"kristijanhusak/vim-dadbod-completion",
	},

	vim.keymap.set("n", "<LEADER>db", "<CMD>DBUIToggle<CR>", { desc = "Toggle dadbod" }),
}
