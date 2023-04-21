local M = {}

M.code_runner = {
        n = {
                ["<leader>rf"] = {"<cmd>RunFile<cr>", "Run File"},
                ["<leader>rc"] = {"<cmd>RunClose<cr>", "Run Close"},
        },
}

return M
