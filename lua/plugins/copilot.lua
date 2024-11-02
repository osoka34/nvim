return {
  "github/copilot.vim",
  config = function()

    vim.g.copilot_disable_diagnostics = true
    -- Оставляем Tab для принятия предложений
    -- Не устанавливаем vim.g.copilot_no_tab_map
  end,
}
