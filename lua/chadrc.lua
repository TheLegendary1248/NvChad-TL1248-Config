-- Path to overriding theme and highlights files
local highlights = require "highlights"
---@type ChadrcConfig
local M = {
  base46 = {
    theme = "glassppuccin",
    transparency = false
  },
  ui = {
    statusline = {
      modules = {
        -- cursor = function()
        --   return "Yaimo!" end,
      }
    },
    tabufline = {
      modules = {
        abc = function()
          return "hi"
        end,
      }
    }
  },
  nvdash = {
    load_on_startup = true
  },
  colorify = {
    enabled = true,
    mode = "bg"
  }
}
return M
