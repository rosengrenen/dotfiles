local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        -- TODO: create lsp keybinds
    end
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
    lspconfig[server].setup({
        capabilities = capabilities
    })
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = { default_setup },
})

local cmp = require('cmp')
local luasnip = require("luasnip")

local luasnip_jump_forward = function(fallback)
    if luasnip.jumpable(1) then
        luasnip.jump(1)
    else
        fallback()
    end
end

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = "luasnip" }
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-h>'] = cmp.mapping.abort(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-l>'] = cmp.mapping.confirm({ select = true }),
        -- TODO: cannot remap to C-; because of vim, but will be fine as soon as we colemak things
        ['<C-f>'] = cmp.mapping(luasnip_jump_forward, { 'i', 's' }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
