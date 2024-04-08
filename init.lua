require('core.launch')

spec "core.config.colorscheme"
spec "core.config.leap"
spec "core.config.tabby"
spec "core.config.which-key"
spec "core.config.nvim-treesitter"
spec "core.config.nvim-tree"
spec "core.config.telescope"
spec "core.config.telescope-file-browser"
spec "core.config.comment"
spec "core.config.lsp-color"
spec "core.config.lualine"
spec "core.config.ibl"
spec "core.config.buffer_mgr"
spec "core.config.neoscroll"
spec "core.config.lsp_config"
spec "core.config.completions"
--spec "core.config.harpoon"

spec "core.config.bonus"

require('core.keymaps')
require('core.options')
require('core.lazy')

--THEME
vim.o.termguicolors = true
vim.cmd.colorscheme "darkplus"
