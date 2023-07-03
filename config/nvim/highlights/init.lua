local get_hlgroup = require("astronvim.utils").get_hlgroup
-- get highlights from highlight groups
local normal = get_hlgroup "Normal"
local fg, bg = '#EBDBB2', '#32302F'
local bg_alt = '#504945'
local green = get_hlgroup("String").fg
local red = get_hlgroup("Error").fg

return { -- this table overrides highlights in all themes
  -- Normal = {
  --   bg = "#000000",
  -- },
  TelescopeBorder = { fg = bg_alt, bg = bg },
  TelescopeNormal = { bg = fg },
  TelescopePreviewBorder = { fg = bg, bg = bg },
  TelescopePreviewNormal = { bg = bg },
  TelescopePreviewTitle = { fg = bg, bg = green },
  TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
  TelescopePromptNormal = { fg = fg, bg = bg_alt },
  TelescopePromptPrefix = { fg = red, bg = bg_alt },
  TelescopePromptTitle = { fg = bg, bg = red },
  TelescopeResultsBorder = { fg = bg, bg = bg },
  TelescopeResultsNormal = { bg = bg },
  TelescopeResultsTitle = { fg = bg, bg = bg },
  NeoTreeEndOfBuffer = {
    bg = '#282828'
  },
  NeoTreeNormal = {
    bg = '#282828'
  },
  StatuslineModeNormal = {
    bg = fg
  },
  DiagnosticError = {
    fg = '#C64C37'
  },
  DiagnosticWarn = {
    fg = '#D8A44E'
  },
  DiagnosticHint = {
    fg = '#A9B665'
  },
  DiagnosticInfo = {
    fg = '#b16286'
  },
}
