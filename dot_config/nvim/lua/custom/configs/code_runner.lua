local code_runner = require("code_runner")

code_runner.setup {
        mode = 'term',
        focus = true,
        term = {
                position = "bot",
                size = 12,
        },
        before_run_filetype = function()
                vim.cmd(":w")
        end,
        filetype = {
                c = {
                        "cd $dir &&",
                        "clang $fileName",
                        "-o $fileNameWithoutExt &&",
                        "$dir/$fileNameWithoutExt"
                },
                python = "python -u",
                sh = "bash",
        }
}
