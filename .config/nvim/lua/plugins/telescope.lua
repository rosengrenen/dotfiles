return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/which-key.nvim",
    },
    init = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>f"] = { name = "Find in files" },
        })
    end,
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous"
                }
            }
        }
    },
    keys = {
        {
            "<leader>ff",
            mode = "n",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find all files"
        },
        {
            "<leader>fg",
            mode = "n",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Find git files"
        },
        {
            "<leader>fh",
            mode = "n",
            function()
                require("telescope.builtin").find_files { hidden = true }
            end,
            desc = "Find hidden files"
        },
        {
            "<leader>fj",
            mode = "n",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Find in files"
        },
    }
}
