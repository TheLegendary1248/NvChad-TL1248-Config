local overrides = require("configs.overrides")
local sfx_path = "~/.config/nvim/sfx/"
local sfx_volume = 100
---@type NvPluginSpec[]
local plugins = {
  -- Custom
  {"xiyaowong/transparent.nvim",
    enabled = false,
    -- lazy = false,
    opts = {
      exclude_groups = {'CursorLine'},
    }
  },
{"HiPhish/rainbow-delimiters.nvim", enabled = true, lazy = false},
  "tpope/vim-surround",
  -- lazy.nvim (TAKEN STRAIGHT FROM README)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
    -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        }
  },
  {"rcarriga/nvim-notify",
    opts = {
      stages = "fade"
    }
  },
  {"junegunn/goyo.vim", lazy = false},
  {"whleucka/reverb.nvim", 
    lazy = false,
    event = "BufReadPre",
    opts = {
      player = "pw-play",
      sounds = {
        -- add custom sound paths for other events here
        -- eg. EVENT = "/some/path/to/sound.mp3"
        TextChangedI = { path = sfx_path .. "Stone_dig2.ogg", volume = sfx_volume },
        CursorMoved = { path = sfx_path .. "Stone_hit5.ogg", volume = sfx_volume },
        -- WinScrolled = { path = sfx_path .. "Note_block_hat.mp3", volume = sfx_volume },
        FocusGained = { path = sfx_path .. "Spyglass_use.mp3", volume = sfx_volume },
        FocusLost = { path = sfx_path .. "Spyglass_stop.mp3", volume = sfx_volume },
        WinNew = { path = sfx_path .. "Grass_dig3.ogg", volume = sfx_volume },
        TabEnter = { path = sfx_path .. "Page_turn3.ogg", volume = sfx_volume },
        BufEnter = { path = sfx_path .. "Page_turn3.ogg", volume = sfx_volume },
        -- InsertLeave = { path = sfx_path .. "toggle.ogg", volume = sfx_volume },
        VimLeave = { path = sfx_path .. "Click.ogg", volume = sfx_volume },
        BufWrite = { path = sfx_path .. "Ender_Chest_close.ogg", volume = sfx_volume },
        BufRead = { path = sfx_path .. "Ender_Chest_open.ogg", volume = sfx_volume },
        CmdlineLeave = { path = sfx_path .. "Enchanting_Table_enchant2.ogg", volume = sfx_volume },
        TextYankPost = { path = sfx_path .. "Pop.mp3", volume = sfx_volume },
        CmdlineChanged = { path = sfx_path .. "Copper_step4.mp3", volume = sfx_volume },
        ModeChanged = { path = sfx_path .. "Amethyst_step10.mp3", volume = sfx_volume },
        RecordingEnter = { path = sfx_path .. "Amethyst_step10.mp3", volume = sfx_volume },
        RecordingLeave = { path = sfx_path .. "Amethyst_step10.mp3", volume = sfx_volume },
        -- ^ Applies to changes not by user
      },
    },
  },
  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "pyright",
        "typescript-language-server",
        "gitui",
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
