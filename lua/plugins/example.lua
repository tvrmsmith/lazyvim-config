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
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = "󰢹 ",
              key = "m",
              desc = "Start Remote Session",
              action = ":RemoteStart",
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = false,
        inc_rename = true,
        lsp_doc_border = true,
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
            "ruby@3.1.7",
            "--",
            "bundle",
            "exec",
            "--gemfile=.ruby-lsp/Gemfile",
            "ruby-lsp",
          },
        },
        solargraph = {
          mason = false,
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
      remote = {
        app_name = "nvim-LazyVim",
      },
      -- client_callback = function(port, workspace_config)
      --   local cmd = ("open -a warp '/opt/homebrew/bin/nvim' --args '--server localhost:%s --remote-ui'"):format(port)
      --   print("Running the command:" .. cmd)
      --   vim.fn.jobstart(cmd, {
      --     detach = true,
      --     on_exit = function(job_id, exit_code, event_type)
      --       -- This function will be called when the job exits
      --       print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
      --     end,
      --   })
      -- end,
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
          rspec_cmd = function()
            -- local dockerExists = vim.fn.executable("docker") == 1
            -- if vim.env.NEOTEST_RUBY_USE_BUNDLE == "true" or not dockerExists then
            return vim
              .iter({
                "bundle",
                "exec",
                "rspec",
              })
              :flatten()
              :totable()
            -- end
            --
            -- return vim
            --   .iter({
            --     "docker",
            --     "compose",
            --     "run",
            --     "--rm",
            --     "emr",
            --     "bundle",
            --     "exec",
            --     "rspec",
            --   })
            --   :flatten()
            --   :totable()
          end,

          -- transform_spec_path = function(path)
          --   local prefix = require("neotest-rspec").root(path)
          --   return string.sub(path, string.len(prefix) + 2, -1)
          -- end,
          --
          -- results_path = "tmp/rspec.output",
          -- formatter = "json",
        },
      },
    },
  },
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      require("lazydocker").setup({
        border = "curved", -- valid options are "single" | "double" | "shadow" | "curved"
      })
    end,
    event = "BufRead",
    keys = {
      {
        "<leader>ld",
        function()
          require("lazydocker").open()
        end,
        desc = "Open Lazydocker floating window",
      },
    },
  },
  {
    "andythigpen/nvim-coverage",
    version = "*",
    config = function()
      require("coverage").setup({
        auto_reload = true,
      })
    end,
  },
}
