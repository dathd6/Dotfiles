return {
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = 'medium'
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.o.background = 'dark'
    end
  }
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
