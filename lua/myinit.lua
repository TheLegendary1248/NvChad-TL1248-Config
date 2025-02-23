-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
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
