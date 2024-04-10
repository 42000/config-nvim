local M = {
    'williamboman/mason.nvim',

    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'Hoffs/omnisharp-extended-lsp.nvim',
    },
}

function M.config()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "texlab",
            "omnisharp_mono",
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

    local pid = vim.fn.getpid()
    local dpath = vim.fn.stdpath("data")
    -- local omnisharp_bin = "C:/Users/User/AppData/Local/nvim-data/mason/packages/omnisharp_MONO/OmniSharp.exe"
    -- local nvim_lsp = require'lspconfig'
    -- local path_td = 'C:/Users/User/AppData/Local/nvim-data/mason/packages/omnisharp_MONO/'

    require("lspconfig").omnisharp_mono.setup {
        on_attach = on_attach,
        capabilities = capabilities,

        cmd = {
            -- 'mono',
            -- '--assembly-loader=strict',
            dpath .. "/mason/bin/omnisharp-mono",
            "--languageserver",
            '--hostPID',
            tostring(pid),
        },
        handlers = {
            ["textDocument/definition"] = require('omnisharp_extended').handler,
        },
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = false,
        enable_roslyn_analyzers = false,
        organize_imports_on_format = false,
        enable_import_completion = false,
        sdk_include_prereleases = true,
        analyze_open_documents_only = false,

        -- usemono = true,
        -- root_dir = require("lspconfig").util.root_pattern("*.csproject", "*.sln"),
    }

    require("lspconfig").texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    }
end

return M
