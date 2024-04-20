spec "core.config.flash"
spec "core.config.comment"
spec "core.config.ibl"

vim.cmd[[nnoremap <C-j> <C-d>]]
vim.cmd[[nnoremap <C-k> <C-u>]]
vim.cmd[[nnoremap j gj]]
vim.cmd[[nnoremap k gk]]

require('core.keymaps')
require('core.options')
require('core.lazy')
