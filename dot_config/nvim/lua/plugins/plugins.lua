return {
  {
    "savq/melange-nvim",
  },

  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  -- },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "melange",
    },
  },

  {
    "Civitasv/cmake-tools.nvim",
    keys = {
      { "<leader>ckc", "<cmd>CMakeClean<cr>", desc = "(C)Ma(k)e (C)lean", mode = { "n" } },
      { "<leader>ckg", "<cmd>CMakeGenerate<cr>", desc = "(C)Ma(k)e (G)enerate", mode = { "n" } },
      { "<leader>ckb", "<cmd>CMakeBuild<cr>", desc = "(C)Ma(k)e (B)uild", mode = { "n" } },
      { "<leader>ckr", "<cmd>CMakeRun<cr>", desc = "(C)Ma(k)e (R)un", mode = { "n" } },
      { "<leader>ckf", "<cmd>CMakeRunCurrentFile<cr>", desc = "(C)Ma(k)e Run Current (F)ile", mode = { "n" } },
      { "<leader>ckt", "<cmd>CMakeRunTest<cr>", desc = "(C)Ma(k)e (T)est", mode = { "n" } },
      { "<leader>ckx", "<cmd>CMakeSelectBuildTarget<cr>", mode = { "n" } },
      { "<leader>ckz", "<cmd>CMakeSelectLaunchTarget<cr>", mode = { "n" } },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      PATH = "append",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local mason_servers = { "emmet_language_server" }

      opts.servers = {
        clangd = {},
        lua_ls = {},
        pylsp = {},
        ruff = {},
        html = {},
        cssls = {},
        ts_ls = {},
        emmet_language_server = {},
      }

      for server, server_opts in pairs(opts.servers) do
        server_opts.mason = false
      end

      for _, server in ipairs(mason_servers) do
        opts.servers[server] = { mason = true }
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        html = { "prettierd" },
        css = { "prettierd" },
        js = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        sh = { "shfmt" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- c = { "clangtidy" },
        -- cpp = { "clangtidy" },
        python = { "ruff" },
      },
    },
  },

  {
    "nvim-focus/focus.nvim",
    opts = true,
  },

  {
    "CRAG666/code_runner.nvim",
    ft = { "c", "python", "sh" },
    opts = {
      filetype = {
        c = {
          "cd $dir &&",
          "clang -Wall -Wextra -std=c2x -pedantic -lm $fileName",
          "-o $fileNameWithoutExt &&",
          "$dir/$fileNameWithoutExt &&",
          "rm $dir/$fileNameWithoutExt",
        },
        python = "python -u",
        sh = "bash",
      },
    },
  },

  {
    "kawre/leetcode.nvim",
    -- build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "python3",
    },
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        css = true,
      },
    },
  },

  {
    "karb94/neoscroll.nvim",
    opts = {},
  },

  -- {
  --   "olimorris/codecompanion.nvim",
  --   lazy = true,
  --   dependencies = {
  --     "ravitemer/mcphub.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   keys = {
  --     {
  --       "<leader>ac",
  --       "<cmd>CodeCompanionActions<cr>",
  --       desc = "CodeCompanionActions",
  --       mode = { "n", "v" },
  --       noremap = true,
  --       silent = true,
  --     },
  --     {
  --       "<leader>aa",
  --       "<cmd>CodeCompanionChat Toggle<cr>",
  --       desc = "CodeCompanionChat",
  --       mode = { "n", "v" },
  --       noremap = true,
  --       silent = true,
  --     },
  --     { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = { "v" }, noremap = true, silent = true },
  --   },
  --   opts = {
  --     display = {
  --       chat = {
  --         auto_scroll = false,
  --       },
  --     },
  --     adapters = {
  --       opts = {
  --         show_defaults = false,
  --         show_model_choices = false,
  --       },
  --     },
  --     strategies = {
  --       chat = {
  --         adapter = {
  --           name = "copilot",
  --           model = "gpt-4.1",
  --           -- model = "claude-sonnet-4",
  --         },
  --       },
  --     },
  --     extensions = {
  --       mcphub = {
  --         callback = "mcphub.extensions.codecompanion",
  --         opts = {
  --           make_vars = true,
  --           make_slash_commands = true,
  --           show_result_in_chat = true,
  --         },
  --       },
  --     },
  --   },
  -- },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = function(_, opts)
  --     -- Create the CodeCompanion status component
  --     local codecompanion_status = require("lualine.component"):extend()
  --
  --     codecompanion_status.processing = false
  --     codecompanion_status.spinner_index = 1
  --
  --     local spinner_symbols = {
  --       "CodeCompanion ⠋",
  --       "CodeCompanion ⠙",
  --       "CodeCompanion ⠹",
  --       "CodeCompanion ⠸",
  --       "CodeCompanion ⠼",
  --       "CodeCompanion ⠴",
  --       "CodeCompanion ⠦",
  --       "CodeCompanion ⠧",
  --       "CodeCompanion ⠇",
  --       "CodeCompanion ⠏",
  --     }
  --     local spinner_symbols_len = 10
  --
  --     -- Initializer
  --     function codecompanion_status:init(options)
  --       codecompanion_status.super.init(self, options)
  --
  --       local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
  --
  --       vim.api.nvim_create_autocmd({ "User" }, {
  --         pattern = "CodeCompanionRequest*",
  --         group = group,
  --         callback = function(request)
  --           if request.match == "CodeCompanionRequestStarted" then
  --             self.processing = true
  --           elseif request.match == "CodeCompanionRequestFinished" then
  --             self.processing = false
  --           end
  --         end,
  --       })
  --     end
  --
  --     -- Function that runs every time statusline is updated
  --     function codecompanion_status:update_status()
  --       if self.processing then
  --         self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
  --         return spinner_symbols[self.spinner_index]
  --       else
  --         return nil
  --       end
  --     end
  --
  --     -- Add the component to lualine sections
  --     opts.sections = opts.sections or {}
  --     opts.sections.lualine_x = opts.sections.lualine_x or {}
  --
  --     -- Insert the CodeCompanion status component
  --     table.insert(opts.sections.lualine_x, {
  --       codecompanion_status,
  --       color = { fg = "#ff9e64" }, -- Optional: customize color
  --     })
  --
  --     return opts
  --   end,
  -- },

  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   ft = { "markdown", "codecompanion" },
  -- },

  -- {
  --   "HakonHarnes/img-clip.nvim",
  --   event = "VeryLazy",
  --   cmd = "PasteImage",
  --   opts = {
  --     filetypes = {
  --       codecompanion = {
  --         prompt_for_file_name = false,
  --         template = "[Image]($FILE_PATH)",
  --         use_absolute_path = true,
  --       },
  --     },
  --   },
  -- },
  --
  -- {
  --   "ravitemer/mcphub.nvim",
  --   lazy = true,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   build = "npm install -g mcp-hub@latest",
  --   opts = true,
  -- },

  -- {
  --   "navarasu/onedark.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("onedark").setup({
  --       style = "deep",
  --     })
  --     -- Enable theme
  --     require("onedark").load()
  --   end,
  -- },
}
