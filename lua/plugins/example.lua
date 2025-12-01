-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fC",
        function()
          Snacks.explorer.reveal()
        end,
        desc = "Explorer Snacks (reveal current file)",
      },
    },
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        matchers = {
          frecency = true,
          cwd_bonus = true,
        },
        layout = {
          preset = "dropdown",
        },
        layouts = {
          dropdown = {
            layout = {
              width = 0.8,
              min_width = 120,
            },
          },
        },
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
          gh_diff = {
            layout = {
              preset = "ivy_split",
            },
          },
        },
      },
    },
  },
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "hcl",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },

  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "terraform-ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    -- "Afourcat/treesitter-terraform-doc.nvim",
    -- "lspcontainers/lspcontainers.nvim"
    -- },
    opts = {
      servers = {
        -- terraformls = {
        --   on_attach = function(_, _)
        --     require("treesitter-terraform-doc").setup({})
        --   end,
        ruby_lsp = {
          mason = false,
          cmd = {
            "mise",
            "exec",
            "ruby@3.4.7",
            "--",
            "bundle",
            "exec",
            "--gemfile=" .. vim.fn.expand("~/dev/ruby-lsp/Gemfile"),
            "ruby-lsp",
          },
        },
      },
    },
  },
  {
    "aliqyan-21/wit.nvim",
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      stiffness = 0.5,
      trailing_stiffness = 0.5,
      matrix_pixel_threshold = 0.5,
    },
  },
  {
    "dstein64/nvim-scrollview",
  },
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
  },
  {
    "lewis6991/satellite.nvim",
  },
  {
    "mrjones2014/op.nvim",
    build = "make install",
  },
  {
    "nvim-mini/mini.operators",
  },
  {
    "nvim-mini/mini.files",
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
  },
  {
    "willothy/flatten.nvim",
    config = true,
    -- or pass configuration with
    -- opts = {  }
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },
  {
    "johannes-graner/remote-nvim.nvim",
    branch = "fix/pty-argument", -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim", -- For standard functions
      "MunifTanjim/nui.nvim", -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    opts = {
      devpod = {
        dotfiles = {
          path = "https://github.com/tvrmsmith/dotfiles.git",
        },
      },
    },
    config = true,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          rspec_cmd = ".neotest-rspec-docker.sh",
        },
      },
    },
  },
}
