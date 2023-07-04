local get_hlgroup  = require("astronvim.utils").get_hlgroup
-- get highlights from highlight groups
local fg, bg       = '#EBDBB2', '#282828'
local telescope_bg = '#32302F'
local bg_alt       = '#504945'
local string       = get_hlgroup("String").fg
local error        = get_hlgroup("Error").fg
local warn         = '#D8A44E'
local info         = get_hlgroup("Info").fg

return { -- this table overrides highlights in all themes
  -- Normal = {
  --   bg = "#000000",
  -- },
  TelescopeBorder = { fg = bg_alt, bg = telescope_bg },
  TelescopeNormal = { bg = fg },
  TelescopePreviewBorder = { fg = telescope_bg, bg = telescope_bg },
  TelescopePreviewNormal = { bg = telescope_bg },
  TelescopePreviewTitle = { fg = telescope_bg, bg = string },
  TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
  TelescopePromptNormal = { fg = fg, bg = bg_alt },
  TelescopePromptPrefix = { fg = error, bg = bg_alt },
  TelescopePromptTitle = { fg = telescope_bg, bg = error },
  TelescopeResultsBorder = { fg = telescope_bg, bg = telescope_bg },
  TelescopeResultsNormal = { bg = telescope_bg },
  TelescopeResultsTitle = { fg = telescope_bg, bg = telescope_bg },
  NeoTreeEndOfBuffer = {
    bg = bg
  },
  NeoTreeNormal = {
    bg = bg
  },
  StatuslineModeNormal = {
    bg = fg
  },
  DiagnosticError = {
    fg = error
  },
  DiagnosticWarn = {
    fg = warn
  },
  DiagnosticHint = {
    fg = string
  },
  DiagnosticInfo = {
    fg = info
  },
}
