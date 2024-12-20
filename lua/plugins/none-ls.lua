return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Форматтеры
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.goimports,
					-- null_ls.builtins.formatting.gci,                 -- Добавляем gci
					null_ls.builtins.formatting.goimports_reviser, -- Добавляем goimports-reviser
					null_ls.builtins.formatting.golines, -- Добавляем golines
					null_ls.builtins.formatting.gofmt, -- Добавляем gofmt

					-- Форматирование Protobuf файлов с помощью buf format
					null_ls.builtins.formatting.buf.with({
						command = "buf",
						args = { "format", "-" },
						filetypes = { "proto" },
					}),

					-- Линтинг Protobuf файлов с помощью buf lint
					null_ls.builtins.diagnostics.buf.with({
						command = "buf",
						args = { "lint", "--path", "$FILENAME" },
						filetypes = { "proto" },
					}),

					-- Линтеры
					-- null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.diagnostics.golangci_lint,

					-- Другие утилиты
					null_ls.builtins.code_actions.gomodifytags, -- Добавляем gomodifytags для модификации тегов
					-- null_ls.builtins.code_actions.gotests, -- Добавляем gotests для генерации тестов
				},
			})

			-- Настройка горячей клавиши для форматирования
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
		end,
	},
}
