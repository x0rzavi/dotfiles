local code_runner = require("code_runner")

code_runner.setup {
        mode = 'term',
        term = {
                position = "bot",
                size = 15
        },
        before_run_filetype = function()
                vim.cmd(":w")
        end,
        filetype = {
                c = {
                        "cd $dir &&",
                        "clang -lm $fileName",
                        "-o $fileNameWithoutExt &&",
                        "$dir/$fileNameWithoutExt"
                },
                python = "python -u",
                sh = "bash",
        }
}
