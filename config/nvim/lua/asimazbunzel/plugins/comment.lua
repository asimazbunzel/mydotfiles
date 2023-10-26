return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    -- comment on normal mode
    vim.keymap.set("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end, { noremap = true, silent = true })

    -- comment on selection
    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    vim.keymap.set("x", "<leader>/", function() vim.api.nvim_feedkeys(esc, "nx", false) require("Comment.api").toggle.linewise(vim.fn.visualmode()) end)
  end
}
