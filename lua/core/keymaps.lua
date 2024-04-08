vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', {silent=true})

-- vim.keymap.set('n', '<leader>cp', ':e C:/Users/User/AppData/Local/nvim/lua/core/plugins.lua<CR>')
-- vim.keymap.set('n', '<leader>ci', ':e C:/Users/User/AppData/Local/nvim/init.lua<CR>')


--TABS
vim.keymap.set('n', '<Tab>', ':tabnext<CR>', {silent=true})
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>', {silent=true})
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', {silent=true})
vim.keymap.set('n', '<leader>x', ':tabclose<CR>', {silent=true})

vim.keymap.set({'n', 'v'}, '<leader>/', ':CommentToggle<CR>', {silent=true})
vim.keymap.set({'i', 'n', 'v'}, '<C-/>', ':let @/ = ""<CR>', {silent=true})

-- COPY/PASTE

vim.keymap.set({'n', 'v'}, '<C-S-c>', '"*y', {silent=true})
vim.keymap.set({'n', 'v'}, '<C-S-v>', '"*p', {silent=true})
vim.keymap.set({'n', 'v'}, '<S-Insert>', '"*p', {silent=true})

vim.keymap.set('i', '<C-S-v>', '<Esc>"*pi', {silent=true})
vim.keymap.set('i', '<S-Insert>', '<Esc>"*pi', {silent=true})

vim.keymap.set('n', 'j', 'gj', {silent=true})
vim.keymap.set('n', 'k', 'gk', {silent=true})

-- ZOOM
require("core.config.font_handler")
vim.keymap.set('n', "éé", function() ResizeGuiFont(1) end, opts)
vim.keymap.set('n', "é&", function() ResizeGuiFont(-1) end, opts)
vim.keymap.set('n', "é²", function() ResetGuiFont() end, opts)

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', {silent=true})
--vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', {silent=true})
vim.keymap.set('n', '<leader>m', ':Telescope marks<CR>', {silent=true})

vim.keymap.set('n', '<leader>b', function() require("buffer_manager.ui").toggle_quick_menu() end, {silent=true})
