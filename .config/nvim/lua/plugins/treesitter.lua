return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "folke/which-key.nvim",
    },
    init = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>t"] = { name = "Select syntax tree" }
        })
    end,
    opts = {
        auto_install = true,
        highlight = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<leader>tt",
                node_incremental = "<leader>tk",
                scope_incremental = "<leader>tl",
                node_decremental = "<leader>tj",
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
