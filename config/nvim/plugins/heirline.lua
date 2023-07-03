return {
  "rebelot/heirline.nvim",
  event = "BufEnter",
  opts = function()
    local status = require "astronvim.utils.status"
    return {
      opts = {
        disable_winbar_cb = function(args)
          return not require("astronvim.utils.buffer").is_valid(args.buf)
              or status.condition.buffer_matches({
                buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
              }, args.buf)
        end,
      },
      statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode {
          -- enable mode text with padding as well as an icon before it
          mode_text = { icon = { kind = "VimIcon", padding = { right = 1, left = 1 } } },
          -- surround the component with a separators
          surround = {
            -- it's a left element, so use the left separator
            separator = "left",
            color = 'fg'
          },
          hl = {
            bg = 'fg'
          }
        },
        status.component.git_branch {
          hl = { fg = "fg" }
        },
        status.component.git_diff { padding = { left = 0 }, surround = { separator = "none" } },
        status.component.fill(),
        {
          status.component.builder {
            { provider = require("astronvim.utils").get_icon "Right" },
            -- add padding after icon
            padding = { right = 1, left = 0 },
            -- set the icon foreground
            hl = { fg = "bg_hl", bg = "bg" },
            -- use the right separator and define the background color
            -- as well as the color to the left of the separator
          },
          status.component.file_info {
            file_icon = { pading = { left = 0 } },
            filename = { fallback = "Empty" },
            padding = { right = 2 },
            hl = { bg = 'bg_hl', fg = 'winbar_fg' },
            surround = { seperator = "center", color = "#3C3836" }
          },
        },
        status.component.fill(),
        status.component.diagnostics(),
        status.component.lsp(),
        status.component.treesitter(),
        { -- make nav section with icon border
          -- define a custom component with just a file icon
          hl = { bg = "bg" },
          -- add a navigation component and just display the percentage of progress in the file
          status.component.builder {
            { provider = require("astronvim.utils").get_icon "NavText" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the icon foreground
            hl = { fg = "bg", bg = "fg" },
            -- use the right separator and define the background color
            -- as well as the color to the left of the separator
            surround = { separator = "right" },
          },
          status.component.nav {
            percentage = false,
            hl = { bg = "fg", fg = "bg" },
            scrollbar = false,
            padding = { right = 2 },
            surround = { separator = "none" },
          },
          status.component.builder {
            { provider = require("astronvim.utils").get_icon "Seperator" },
            -- add padding after icon
            padding = { right = 2, left = 1 },
            -- set the icon foreground
            hl = { fg = "bg", bg = "fg" },
            -- use the right separator and define the background color
            -- as well as the color to the left of the separator
            surround = { separator = "none" },
          },
          status.component.builder {
            { provider = require("astronvim.utils").get_icon "ScrollText" },
            -- add padding after icon
            padding = { left = 2 },
            -- set the icon foreground
            hl = { fg = "bg", bg = "fg" },
            -- use the right separator and define the background color
            -- as well as the color to the left of the separator
            surround = { separator = "none" },
          },
          status.component.nav {
            percentage = { padding = { right = 0, left = 1 } },
            hl = { bg = "fg", fg = "bg" },
            ruler = false,
            scrollbar = { hl = { fg = 'winbar_fg' } },
            padding = { left = 0, right = 1 },
            surround = { separator = "none" },
          }
        },
      },
      winbar = { -- create custom winbar
        -- store the current buffer number
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false, -- pick the correct winbar based on condition
        -- inactive winbar
        {
          condition = function() return not status.condition.is_active() end,
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
          -- add the file name and icon
          status.component.file_info {
            file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbarnc", true),
            surround = false,
            update = "BufEnter",
          },
        },
        -- active winbar
        {
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
          -- add the file name and icon
          status.component.file_info { -- add file_info to breadcrumbs
            file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbar", true),
            surround = false,
            update = "BufEnter",
          },
          -- show the breadcrumbs
          status.component.breadcrumbs {
            icon = { hl = true },
            hl = status.hl.get_attributes("winbar", true),
            prefix = true,
            padding = { left = 0 },
          },
        },
      },
      statuscolumn = vim.fn.has "nvim-0.9" == 1 and {
        status.component.foldcolumn(),
        status.component.fill(),
        status.component.numbercolumn(),
        status.component.signcolumn(),
      } or nil,
    }
  end,
  config = require "plugins.configs.heirline",
}
