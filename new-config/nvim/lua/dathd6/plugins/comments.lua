return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })

    -- Keybindings for commenting
    vim.api.nvim_set_keymap("n", "<leader>/", "gcc", { noremap = false, silent = true }) -- Comment/uncomment current line in normal mode
    vim.api.nvim_set_keymap("v", "<leader>/", "gc", { noremap = false, silent = true }) -- Comment/uncomment selected lines in visual mode
  end,
}
