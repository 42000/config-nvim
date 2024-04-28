local M = {
    'sainnhe/gruvbox-material',
    'LunarVim/darkplus.nvim',
    'rebelot/kanagawa.nvim',

    -- FLASH COMPATIBLE
    'catppuccin/nvim',
    'folke/tokyonight.nvim',

    --'Mofiqul/vscode.nvim',
    --'aktersnurra/no-clown-fiesta.nvim',
    'savq/melange-nvim',

    lazy = false,
    priority = 1000,
}

function gruvboxInit()
    -- OPTIONS:  'hard', 'medium', 'soft'
    vim.cmd("let g:gruvbox_material_background='hard'")
    -- OPTIONS:  'material', 'mix', 'original'
    vim.cmd("let g:gruvbox_material_foreground='mix'")
    vim.cmd("let g:gruvbox_better_performance = 1")

    vim.cmd("let g:gruvbox_material_enable_italic = 1")
    vim.cmd("let g:gruvbox_material_enable_bold = 1")

    vim.cmd("let g:gruvbox_material_diagnostic_text_highlight = 1")
    vim.cmd("let g:gruvbox_material_diagnostic_line_highlight = 1")

    SetTheme('gruvbox-material')
end

function M.config() end

return M
