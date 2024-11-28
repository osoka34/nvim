-- catppuccin.lua

return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        priority = 1000, -- Загружается раньше других плагинов
        config = function()
            require("tokyonight").setup({
                style = "night", -- Доступные стили: "storm", "night", "moon"
                transparent = true, -- Если нужен прозрачный фон, установите true
                terminal_colors = true, -- Включить поддержку цветов в терминале
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        -- "catppuccin/nvim",
        -- name = "catppuccin",
        -- priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme("catppuccin")
        -- end,
    },
}
