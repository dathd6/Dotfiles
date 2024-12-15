-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', '<leader>vws', function () vim.lsp.buf.workspace_symbol() end , opts)
    vim.keymap.set('n', '<leader>vd', function () vim.diagnostic.open_float() end , opts)
    vim.keymap.set('n', '[d', function () vim.diagnostic.goto_next() end , opts)
    vim.keymap.set('n', ']d', function () vim.diagnostic.goto_prev() end , opts)
    vim.keymap.set('n', '<leader>vca', function () vim.lsp.buf.code_action() end , opts)
    vim.keymap.set('n', '<leader>vrr', function () vim.lsp.buf.references() end , opts)
    vim.keymap.set('n', '<leader>vrn', function () vim.lsp.buf.rename() end , opts)
  end,
})

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('lspconfig').pyright.setup({})
require('lspconfig').lua_ls.setup({})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
	['<C-p>'] = cmp.mapping.select_prev_item(),
	['<C-n>'] = cmp.mapping.select_next_item(),
	['<tab>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
  }),
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'pyright'}
})
