return {
	-- mason.nvim
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("nvim-navic").setup({
				highlight = true, -- Подсветка текущего контекста
			})
		end,
	},
	-- mason-lspconfig.nvim
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"ast_grep", -- Go + Python
					"bufls", -- Protobuf
					"gopls", -- Go
					"jsonls", -- JSON
					"pbls", -- Protobuf
					"pyright", -- Python
					"ruff", -- python
				},
				automatic_installation = true, -- Автоматическая установка серверов
			})
		end,
	},
	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local navic = require("nvim-navic")

			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})

			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			-- Настройка lua_ls (для Lua)
			lspconfig.lua_ls.setup({
				filetypes = { "lua" }, -- поддерживаемые типы файлов
				-- Можно добавить настройки для lua_ls здесь
				on_attach = on_attach,
			})

			lspconfig.pbls.setup({
				cmd = { "pbls" },
				filetypes = { "proto" },
				root_dir = require("lspconfig").util.root_pattern("buf.yaml", "go.mod", ".git"),
				on_attach = on_attach,
				-- settings = {
				-- 	proto = {
				-- 		-- Настройки для pbls
				-- 		proto_path = "./proto",
				-- 	},
				-- },
			})

			-- Настройка gopls (для Go)
			lspconfig.gopls.setup({
				show_success_message = true, -- Отключаем сообщение об успешном запуске
				cmd = { "gopls" }, -- путь к бинарнику gopls
				filetypes = { "go", "gomod" }, -- поддерживаемые типы файлов
				root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"), -- определение корневой директории проекта
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
					},
				},
				on_attach = on_attach,
			})

			lspconfig.pyright.setup({
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})

			-- Setup Ruff Linter
			lspconfig.ruff_lsp.setup({
				init_options = {
					settings = {
						-- Any extra CLI arguments for `ruff` go here.
						-- args = {
						-- 	"--select=E,F,UP,N,I,ASYNC,S,PTH",
						-- 	"--line-length=79",
						-- 	"--respect-gitignore", -- Исключать из сканирования файлы в .gitignore
						-- 	"--target-version=py311",
						-- },
					},
				},
			})
		end,
	},
}
