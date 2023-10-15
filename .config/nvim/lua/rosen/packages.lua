require("lazy").setup({
    -- LSP
    { "neovim/nvim-lspconfig" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { 'saadparwaiz1/cmp_luasnip' },

    -- Manage LSP servers
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
})
