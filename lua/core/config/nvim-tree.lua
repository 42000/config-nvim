local M = {
    'nvim-tree/nvim-tree.lua',
}

function M.config()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.nvim_tree_update_cwd = 1
    -- vim.cmd [[ set autochdir ]]

    require('nvim-tree').setup({
    sync_root_with_cwd = true,
    })
end

return M
