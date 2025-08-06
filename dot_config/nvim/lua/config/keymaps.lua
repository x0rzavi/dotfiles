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

map("n", "<leader>tm", ":Leet menu<CR>", { desc = "Leetcode menu", noremap = true, silent = false })
map("n", "<leader>tl", ":Leet list<CR>", { desc = "Leetcode problem list", noremap = true, silent = false })
map("n", "<leader>tr", ":Leet run<CR>", { desc = "Leetcode run", noremap = true, silent = false })
map("n", "<leader>ts", ":Leet submit<CR>", { desc = "Leetcode submit", noremap = true, silent = false })
map("n", "<leader>tc", ":Leet console<CR>", { desc = "Leetcode problem console", noremap = true, silent = false })
map("n", "<leader>ti", ":Leet info<CR>", { desc = "Leetcode problem info", noremap = true, silent = false })
map("n", "<leader>tx", ":Leet reset<CR>", { desc = "Leetcode problem reset", noremap = true, silent = false })
