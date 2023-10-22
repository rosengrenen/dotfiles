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
                    -- TODO remove n and p
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous"
                }
            }
        }
    },
    keys = function()
        return {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                mode = "n",
                desc = "Find all files"
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").git_files()
                end,
                mode = "n",
                desc = "Find git files"
            },
            {
                "<leader>fh",
                function()
                    require("telescope.builtin").find_files { hidden = true }
                end,
                mode = "n",
                desc = "Find hidden files"
            },
            {
                "<leader>fj",
                function()
                    require("telescope.builtin").live_grep()
                end,
                mode = "n",
                desc = "Find in files"
            },
        }
    end
}
