-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local global_opt = vim.g

opt.colorcolumn = "80"
global_opt.snacks_animate = false

-- Only set up OSC52 clipboard if running inside Windows Terminal
if vim.fn.environ()["WT_SESSION"] then
  local function my_paste(reg)
    return function(lines)
      local content = vim.fn.getreg('"')
      return vim.split(content, "\n")
    end
  end

  global_opt.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    -- https://github.com/neovim/neovim/issues/28611
    paste = {
      ["+"] = my_paste("+"),
      ["*"] = my_paste("*"),
    },
  }
  opt.clipboard = "unnamedplus"
end
