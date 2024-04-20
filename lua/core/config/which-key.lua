local M = {
    "folke/which-key.nvim",
}

function SetTheme(th)
    vim.o.termguicolors = true
    vim.cmd('colorscheme ' .. th)
    SetLuaLine(th)
end

function M.config()
    	vim.o.timeout = true
    	vim.o.timeoutlen = 300

	local wk = require("which-key")
	-- As an example, we will create the following mappings:
	--  * <leader>ff find files
	--  * <leader>fr show recent files
	--  * <leader>fb Foobar
	-- we'll document:
	--  * <leader>fn new file
	--  * <leader>fe edit file
	-- and hide <leader>1

    local cpath = vim.fn.stdpath("config")
	wk.register({
	    c = {
		name = "config", -- optional group name
		p = {":e " .. cpath .. "/lua/core/config/bonus.lua<CR>", "plugins.lua" }, -- create a binding with label
		i = {":e " .. cpath .. "/init.lua<CR>", "init.lua"}, -- additional options for creating the keymap
		d = {":cd " .. cpath .. "<CR>", "config directory"}, -- additional options for creating the keymap
	    },
	    f = {
		name = "files",
		o = { [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]], "recent files"},
	    },
        t = {
            name = "theme",
            h = {":Telescope colorscheme<CR>", "theme picker"},

            g = { function () gruvboxInit() end, "gruvbox-material"},
            G = { function () SetTheme('gruvbox') end, "gruvbox"},
            d = { function () SetTheme('darkplus') end, "darkplus"},
            c = { function () SetTheme('catppuccin') end, "catppuccin"},
            t = {
                function ()
                    vim.o.termguicolors = true
                    vim.cmd('colorscheme tokyonight-night')
                    SetLuaLine('tokyonight')
                end,
                "tokyonight"},

            m = { function () SetTheme('material') end, "material"},
            k = { function () SetTheme('kanagawa') end, "kanagawa"},
        }
	    }, { prefix = "<leader>" })

    require("which-key").setup {}
end

return M
