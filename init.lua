require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
---custom snippets (12/1/2024)---
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
ls.add_snippets("all", {
  s("::all", { t("") }),
  s("::diff", { t("󰔷") }),
  s("::fill", { t("") }),
  s("::rel", { t("") }),
  s("::many", { t("󰮍") }),
  s("::one", { t("") }),
  s("::dyn", { t("≷") }),
  s("::vary", { t("") }),
  s("::null", { t("󰟢") }),
  s("::rk", { t("") }),
  s("::rj", { t("") }),
  s("::rh", { t("") }),
  s("::rl", { t("") }),
  s("::imp", { t("󰓎") }),
  s("::more", { t("") }),
  s("::less", { t("󰍷") }),
})
vim.o.cursorcolumn = true
vim.o.scrolloff = 4
vim.o.uc = 0
vim.o.rnu = true
vim.o.laststatus=2
vim.o.wrap = false
vim.cmd[[
highlight Cursorline cterm=bold term=bold guibg=#167C3F
highlight Cursorcolumn cterm=bold term=bold guibg=#861A4E
]]
