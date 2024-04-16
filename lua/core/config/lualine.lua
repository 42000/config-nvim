local M = {
    'nvim-lualine/lualine.nvim',
}

function SetLuaLine(th)
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = th,
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

function M.config()
    SetLuaLine('tokyonight')
end

return M
