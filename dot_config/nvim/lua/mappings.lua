require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>rf", ":RunFile<CR>", { desc = "Code runner - Run File", noremap = true, silent = false })
map("n", "<leader>rc", ":RunClose<CR>", { desc = "Code runner - Run Close", noremap = true, silent = false })
