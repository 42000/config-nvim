local M = {
    'ThePrimeagen/harpoon',
    dependencies = 'nvim-lua/plenary.nvim'
}

function M.config()
    require("telescope").load_extension('harpoon')
end

return M
