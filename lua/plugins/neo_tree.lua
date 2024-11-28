return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            window = {
                width = 40,
                mappings = {
                    ["<C-n>"] = "open",
                },
            },
            default_component_configs = {
                indent = {
                    padding = 0, -- Уменьшение отступов, чтобы они не выделялись
                },
            },
            win_options = {
                winblend = 80, -- Устанавливаем прозрачность
            },
        })

        -- Привязка клавиши для открытия Neo-tree
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    end,
}

