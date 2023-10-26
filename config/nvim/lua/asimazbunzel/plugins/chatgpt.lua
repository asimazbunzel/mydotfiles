return {
  "jackMort/ChatGPT.nvim",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },

  event = "VeryLazy",

  config = function()
    local home = os.getenv("HOME")

    require("chatgpt").setup({
      api_key_cmd = "cat " .. home .. "/.local/share/chatgpt.api"
    })

    -- keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>gt", "<cmd>ChatGPT<CR>", { desc = "Open ChatGPT prompt" })
  end,
}
