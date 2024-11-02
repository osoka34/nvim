vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.number = true


-- Привязка Cmd + Backspace для удаления всей строки в режиме вставки
-- vim.api.nvim_set_keymap('i', '<D-BS>', '<C-U>', { noremap = true, silent = true })

-- Привязка Option + Backspace для удаления по словам в режиме вставки
-- vim.api.nvim_set_keymap('i', '<A-BS>', '<C-W>', { noremap = true, silent = true })

