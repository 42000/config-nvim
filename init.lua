require('core.launch')

if vim.g.vscode then
    require('vscode.init')
    return
end
-- THEMES
spec "core.colorscheme.other"
spec "core.colorscheme.gruvbox"
spec "core.colorscheme.material"

spec "core.config.tabby"
spec "core.config.which-key"
spec "core.config.nvim-treesitter"
spec "core.config.nvim-tree"
spec "core.config.telescope"
spec "core.config.telescope-file-browser"
spec "core.config.lsp-color"
spec "core.config.lualine"
spec "core.config.lsp_config"
spec "core.config.completions"
spec "core.config.devicons"
spec "core.config.noice"
spec "core.config.buffer_mgr"
spec "core.config.colorizer"

spec "core.config.neoscroll"

spec "core.config.flash"
spec "core.config.comment"
spec "core.config.ibl"

-- spec "core.config.harpoon"
-- spec "core.config.leap"
spec "core.config.bonus"

require('core.keymaps')
require('core.options')
require('core.lazy')

--THEME
vim.o.termguicolors = true

gruvboxInit()
