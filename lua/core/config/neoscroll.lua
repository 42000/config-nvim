local M = {
  "karb94/neoscroll.nvim",
}

function M.config()

    -- vim.cmd [[
    --     nnoremap <C-j> <C-D>
    --     vnoremap <C-j> <C-D>
    --
    --     nnoremap <C-k> <C-U>
    --     vnoremap <C-k> <C-U>
    -- ]]

    require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        -- mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
        --             '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
    })

    local speed = '250'
    local neoscroll_avail, neoscroll_config = pcall(require, "neoscroll.config")

    if neoscroll_avail then
        neoscroll_config.set_mappings {
            ['<C-k>'] = {'scroll', {'-vim.wo.scroll', 'true', speed }},
            ['<C-j>'] = {'scroll', { 'vim.wo.scroll', 'true', speed }},
            ['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}},
            ['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}},
            ['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}},
            ['<C-e>'] = {'scroll', { '0.10', 'false', '100'}},
            ['zt']    = {'zt', {speed}},
            ['zz']    = {'zz', {speed}},
            ['zb']    = {'zb', {speed}},
        }
    end

    -- local t = {}
    --
    -- -- Syntax: t[keys] = {function, {function arguments}}
    --
    -- require('neoscroll.config').set_mappings(t)
end

return M
