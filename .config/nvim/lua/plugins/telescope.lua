return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/which-key.nvim",
        "debugloop/telescope-undo.nvim",
    },
    init = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>f"] = { name = "Find in..." },
        })
    end,
    config = function()
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous"
                    }
                }
            },
            extensions = {
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.6,
                    },
                    mappings = {
                        i = {
                            ["<S-cr>"] = require("telescope-undo.actions").yank_additions,
                            ["<C-cr>"] = require("telescope-undo.actions").yank_deletions,
                            ["<cr>"] = require("telescope-undo.actions").restore
                        },
                    },
                },
            },
        })
        require("telescope").load_extension("undo")
    end,
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
        {
            "<leader>fu",
            mode = { "n", "x" },
            function()
                require("telescope").extensions.undo.undo()
            end,
            desc = "Show undotree"
        }
    }
}
