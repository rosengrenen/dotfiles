return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
        'nvim-lua/plenary.nvim' },
    keys = function()
        local telescope = require('telescope.builtin');
        local wk = require('which-key')
        wk.register({
            ["<leader>f"] = { name = "Find in files" }
        })
        return {
            { "<leader>ff", telescope.find_files, mode = 'n', desc = 'Find all files' },
            { "<leader>fg", telescope.git_files,  mode = 'n', desc = 'Find git files' },
            {
                "<leader>fh",
                function()
                    telescope.find_files { hidden = true }
                end,
                mode = 'n',
                desc = 'Find hidden files'
            },
            { "<leader>fj", telescope.live_grep, mode = 'n', desc = 'Find in files' },
        }
    end
}
