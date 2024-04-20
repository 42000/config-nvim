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
            -- "omnisharp",
            -- "csharp_ls",
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

    -- local pid = vim.fn.getpid()
    -- local dpath = vim.fn.stdpath("data")
    -- local nvim_lsp = require'lspconfig'

    -- require("lspconfig").omnisharp.setup {
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    --
    --     cmd = {
    --         -- 'mono',
    --         -- '--assembly-loader=strict',
    --         -- dpath .. "/mason/bin/omnisharp",
    --         dpath .. "/mason/packages/omnisharp_bin/OmniSharp.exe",
    --         -- "--languageserver",
    --         -- '--hostPID',
    --         -- tostring(pid),
    --     },
    --     handlers = {
    --         ["textDocument/definition"] = require('omnisharp_extended').handler,
    --     },
    --     useModernNet = false,
    --     enable_editorconfig_support = true,
    --     -- changed
    --     enable_ms_build_load_projects_on_demand = true,
    --     -- changed
    --     enable_roslyn_analyzers = true,
    --     organize_imports_on_format = false,
    --     -- changed
    --     enable_import_completion = true,
    --     sdk_include_prereleases = true,
    --     analyze_open_documents_only = false,
    --
    --     usemono = true,
    --     root_dir = require("lspconfig").util.root_pattern("*.csproject", "*.sln"),
    -- }

    require("lspconfig").csharp_ls.setup({
        cmd = {
            "csharp-ls",
        },
        filetype = {"cs"},
        root_dir = require("lspconfig").util.root_pattern("*.csproject", "*.sln"),

        on_attach = on_attach,
        capabilities = capabilities,
    })

    require("lspconfig").texlab.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

return M
