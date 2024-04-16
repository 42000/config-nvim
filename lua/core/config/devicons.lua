local M = {
    'nvim-tree/nvim-web-devicons',
    -- commit = "313d9e7193354c5de7cdb1724f9e2d3f442780b0"
}

function M.config()
    require'nvim-web-devicons'.setup()
end

return M
