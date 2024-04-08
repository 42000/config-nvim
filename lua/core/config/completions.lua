local M = {
    'hrsh7th/nvim-cmp',

    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            build = 'make_install_jsregexp'
        },

        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-nvim-lsp',

        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim',
    }
}
function M.config()
    local cmp = require("cmp")
    local lspkind = require('lspkind')

    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
    mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<TAB>'] = cmp.mapping.select_next_item(),
            ['<S-TAB>'] = cmp.mapping.select_prev_item(),
        }),

        snippet = {
            expand = function(args)
            require('luasnip').lsp_expand(args.body)
            end,
        },

        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'calc' },
            }, {
            { name = 'buffer' },
        }),

        formatting = {
            format = lspkind.cmp_format(),
        },

        window = {
            completion = {
                border = "rounded",
            },

            documentation = {
                border = "rounded",
            },
        }
    })
end

return M
