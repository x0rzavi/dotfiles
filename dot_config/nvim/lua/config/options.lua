-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local global_opt = vim.g
opt.colorcolumn = "80"

global_opt.snacks_animate = false
global_opt.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = function()
      return vim.fn.getreg("+")
    end,
    ["*"] = function()
      return vim.fn.getreg("*")
    end,
  },
}
opt.clipboard = "unnamedplus"
