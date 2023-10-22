return {
    "mbbill/undotree",
    init = function()
        vim.keymap.set(
            { 'n', 'x' },
            "<leader>u",
            "<cmd>UndotreeToggle<cr>",
            {
                desc = "Toggle undotree"
            }
        )
    end
}
