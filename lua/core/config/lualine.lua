local M = {
    'nvim-lualine/lualine.nvim',
}

function M.config()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'vscode',
        },
        sections = {
            lualine_a = {
            {
                'filename',
                path = 1,
            }
        }}
    }
end

return M
