local M = {
    'williamboman/mason.nvim',

    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
}

function M.config()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "texlab",
            "omnisharp",
        }
    })

    local on_attach = function(_,_)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local capabilities = vim.tbl_deep_extend(
        "force",
        require('cmp_nvim_lsp').default_capabilities(),
        {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
            },
        })

    require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    }

    local path_td = 'C:/Users/User/AppData/Local/nvim-data/mason/packages/omnisharp_MONO/'
    local pid = vim.fn.getpid()
    -- local nvim_lsp = require'lspconfig'

    require("lspconfig").omnisharp.setup {
        flags = {
            debounce_text_changes = 150,
            },
        cmd = {
            -- 'mono',
            -- '--assembly-loader=strict',
            path_td .. 'OmniSharp.exe',
            "--languageserver",
            '--hostPID',
            tostring(pid),
        },
        -- monoPath = 'C:/Program Files/Mono/bin',
        -- usemono = true,
        -- root_dir = require("lspconfig").util.root_pattern("*.csproject", "*.sln"),

        on_attach = on_attach,
        capabilities = capabilities,
    }

    require("lspconfig").texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    }
end

return M
