local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local LAZY_PLUGIN_SPEC = {

    'wbthomason/packer.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'RRethy/vim-illuminate',
    'terrortylor/nvim-comment',
    'folke/lsp-colors.nvim',
    'jiangmiao/auto-pairs',
    "karb94/neoscroll.nvim",

    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').create_default_mappings()
        end
    },

    {
        'nanozuki/tabby.nvim',
        event = 'VimEnter',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            -- configs...
        end,
    },

    -- {
    --     "kylechui/nvim-surround",
    --     tag = "*", -- Use for stability; omit to  `main` branch for the latest features
    --     config = function()
    --         require("nvim-surround").setup({
    --             -- Configuration here, or leave empty to  defaults
    --         })
    --     end
    -- },

    {
        "folke/which-key.nvim",
        config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to  the default settings
            -- refer to the configuration section below
        }
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },

    'nvim-treesitter/nvim-treesitter-refactor',
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    'smartpde/telescope-recent-files',
    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-tree.lua',

    {
        'nvim-tree/nvim-web-devicons',
        commit = "313d9e7193354c5de7cdb1724f9e2d3f442780b0",
    },

    {
        'L3MON4D3/LuaSnip',
        run = 'make_install_jsregexp'
    },

    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',

    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },

    -- AUTO COMPLETE

    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',

    -- THEMES

    'Mofiqul/vscode.nvim',
    'morhetz/gruvbox',
    'LunarVim/darkplus.nvim',
}

function spec(item)
    table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

require('lazy').setup
{
    spec = LAZY_PLUGIN_SPEC,
    change_detection = {
        enabled = true,
        notify = true,
    }
}
