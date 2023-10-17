return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    -- TODO: create lsp keybinds, or maybe in keys
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
