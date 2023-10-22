return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local wk = require("which-key")
                    wk.register({
                        ["<leader>l"] = { name = "LSP actions", buffer = event.buf }
                    })

                    local function make_opts(opts)
                        return {
                            buffer = event.buf,
                            desc = opts.desc
                        }
                    end

                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, make_opts({ desc = "Hover help" }))

                    -- Gotos
                    vim.keymap.set('n', 'gd', function()
                        require('telescope.builtin').lsp_definitions()
                    end, make_opts({ desc = "Go to definition" }))
                    vim.keymap.set('n', 'gD', function()
                        require('telescope.builtin').diagnostics()
                    end, make_opts({ desc = "Go to definition" }))
                    vim.keymap.set('n', 'gr', function()
                        require('telescope.builtin').lsp_references()
                    end, make_opts({ desc = "Go to references" }))
                    vim.keymap.set('n', 'gk', function()
                        require("telescope.builtin").lsp_type_definitions()
                    end, make_opts({ desc = "Go to type definition" }))

                    -- <leader>
                    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, make_opts({ desc = "Show references" }))
                    vim.keymap.set('n', '<leader>lk', vim.lsp.buf.type_definition,
                        make_opts({ desc = "Show type definitions" }))
                    vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, make_opts({ desc = "Rename symbol" }))
                    vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action,
                        make_opts({ desc = "Code action" }))
                    vim.keymap.set('n', '<leader>lf', function()
                        vim.lsp.buf.format { async = true }
                    end, make_opts({ desc = "Format buffer" }))
                    vim.keymap.set('n', '<leader>ld', function()
                        require("telescope.builtin").lsp_document_symbols()
                    end, make_opts({ desc = "Search document symbols" }))
                    vim.keymap.set('n', '<leader>lw', function()
                        require("telescope.builtin").lsp_dynamic_workspace_symbols()
                    end, make_opts({ desc = "Search workspace symbols" }))
                end
            })
        end
    },
    -- Server management
    { "williamboman/mason.nvim", config = true },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp"
        },
        opts = function()
            local lspconfig = require("lspconfig")
            local cmp_lsp = require("cmp_nvim_lsp")
            return {
                handlers = {
                    function(server)
                        local function on_attach(client, bufnr)
                            require("lsp-format").on_attach(client, bufnr)
                        end

                        lspconfig[server].setup({
                            capabilities = cmp_lsp.default_capabilities(),
                            on_attach = on_attach
                        })
                    end
                },
            }
        end
    },
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        opts = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local luasnip_jump_forward = function(fallback)
                if luasnip.jumpable(1) then
                    luasnip.jump(1)
                else
                    fallback()
                end
            end
            return {
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" }
                },
                mapping = {
                    ["<C-h>"] = cmp.mapping.abort(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-l>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-f>"] = cmp.mapping(luasnip_jump_forward, { "i", "s" }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
            }
        end,
    },
    -- Format on save
    {
        "lukas-reineke/lsp-format.nvim",
        opts = {}
    }
}
