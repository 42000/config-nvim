local M = {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = {{
        'nvim-lua/plenary.nvim',
        'smartpde/telescope-recent-files',
    }}
}

function M.config()
    vim.api.nvim_set_keymap(
        "n",
        "<space>fb",
        ":Telescope file_browser<CR>",
    { noremap = true }
    )

    require "telescope".setup {
    pickers = {
        colorscheme = {
        enable_preview = true
        }
    }
    }
end

return M
