---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"
M.ui = {
  theme = "glassppuccin",
  theme_toggle = { "glassppuccin", "one_light" },
  style = "atom",
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "default",
    seperator_style = "arrow",
    modules = {
      cursor = function()
        return "test" end,
    },
  } 
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
