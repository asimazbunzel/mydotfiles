local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },

    -- resize with arrows (yt: @chris@machine)
    ["<C-Up>"] = { ":resize +2<CR>", "resize window", opts = {noremap = true, silent = true} },
    ["<C-Down>"] = { ":resize -2<CR>", "resize window", opts = {noremap = true, silent = true} },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "resize window", opts = {noremap = true, silent = true} },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "resize window", opts = {noremap = true, silent = true} },
  },
}

-- more keybinds!

return M
