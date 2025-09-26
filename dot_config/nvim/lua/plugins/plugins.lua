return {
  {
    "savq/melange-nvim",
  },

  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
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

  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },

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
      local mason_servers = { "emmet_language_server" } -- install with Mason

      opts.servers = { -- all configured servers
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
    opts = true,
  },

  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end,
  },
}
