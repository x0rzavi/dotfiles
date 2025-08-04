-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("i", "jk", "<ESC>")
map("n", "<leader>o", function()
  Snacks.terminal("opencode", { win = { position = "right" } }, { cwd = LazyVim.root() })
end, { desc = "opencode.ai agent" })

map("n", "<leader>ckm", function()
  Snacks.picker.commands({
    pattern = "CMake",
    matcher = {
      ignorecase = true,
      smartcase = false,
    },
    layout = { preview = false },
    confirm = function(picker, item)
      picker:close()
      if item and item.text then
        vim.cmd(item.text)
      end
    end,
  })
end, { desc = "CMake command picker" })

map("n", "<leader>rf", ":RunFile<CR>", { desc = "Code runner - Run File", noremap = true, silent = false })
map("n", "<leader>rc", ":RunClose<CR>", { desc = "Code runner - Run Close", noremap = true, silent = false })
