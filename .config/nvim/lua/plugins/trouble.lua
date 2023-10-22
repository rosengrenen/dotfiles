return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        {
            "<leader>t",
            mode = { "n", "x" },
            function()
                require("trouble").toggle()
            end,
            desc = "Toggle diagnostics"
        }
    }
}
