return {
	-- LSP config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- LSP keymappings
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("<LEADER>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<LEADER>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<LEADER>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					-- Set up document highlight
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- LSP server configurations
			-- Add or modify server configurations here
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								library = {
									"${3rd}/luv/library",
									unpack(vim.api.nvim_get_runtime_file("", true)),
								},
							},
							completion = { callSnippet = "Replace" },
						},
					},
				},
				gopls = {},
				nixd = {},
				-- ts_ls = {},
				denols = {},
				astro = {},
				svelte = {},
				tailwindcss = {},
			}

			local lspconfig = require("lspconfig")
			for server, config in pairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
					settings = config.settings,
				})
			end
		end,
	},

	-- Autoformat
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
				-- lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "nixfmt-rfc-style" },
				go = { "gofmt" },
				typescript = { "prettier" },
			},
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					["<RETURN>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
				},
			})

			cmp.setup.filetype({ "sql" }, {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			})
		end,
	},

	-- Diagnostics
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},

		vim.keymap.set("n", "<LEADER>xx", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Toggle trouble list" }),
		vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo<cr>", {
			silent = true,
			desc = "Todo (Trouble)",
		}),
		vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", {
			silent = true,
			desc = "Quickfix List (Trouble)",
		}),
	},
}
