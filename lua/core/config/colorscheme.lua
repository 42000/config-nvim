local M = {
    'morhetz/gruvbox',
    'Mofiqul/vscode.nvim',
    'LunarVim/darkplus.nvim',
    lazy = false,
    priority = 1000,
}

function M.config()
    vim.o.termguicolors = true
    vim.cmd.colorscheme "darkplus"
end

return M
