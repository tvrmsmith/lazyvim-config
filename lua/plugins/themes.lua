local highlights = {
  "RainbowDelimiterRed",
  "RainbowDelimiterYellow",
  "RainbowDelimiterBlue",
  "RainbowDelimiterOrange",
  "RainbowDelimiterGreen",
  "RainbowDelimiterViolet",
  "RainbowDelimiterCyan",
}
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = { style = "night" },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = {
        highlight = highlights,
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        hl = highlights,
        scope = {
          enabled = false,
          hl = highlights,
        },
      },
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
  },
  -- {
  --   "zaldih/themery.nvim",
  --   lazy = false,
  --   config = function()
  --     require("themery").setup({
  --       themes = {
  --         "tokyonight-night",
  --         "tokyonight-storm",
  --         "tokyonight-day",
  --         "tokyonight-moon",
  --         "onedark",
  --         "onelight",
  --         "onedark_vivid",
  --         "onedark_dark",
  --         "vaporwave",
  --         "catppuccin-latte",
  --         "catppuccin-frappe",
  --         "catppuccin-macchiato",
  --         "catppuccin-mocha",
  --       },
  --       livePreview = true,
  --     })
  --   end,
  -- },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
}
