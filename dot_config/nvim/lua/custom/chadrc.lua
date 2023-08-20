---@type ChadrcConfig 
local M = {}

M.ui = {
  theme = "catppuccin",
  -- statusline = {
  --   separator_style = "block",
  -- }
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
