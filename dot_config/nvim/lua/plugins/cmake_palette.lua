return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        -- Define a new source for CMake commands
        cmake_commands = {
          -- This function will be called to get the items for the picker
          get_items = function()
            local commands = {}
            -- Iterate through all registered commands in Neovim
            for _, cmd_info in pairs(vim.api.nvim_get_commands({})) do
              if cmd_info.name:match("^CMake") then -- Filter for CMake commands
                table.insert(commands, {
                  value = cmd_info.name,
                  text = cmd_info.name,
                  description = cmd_info.info or "No description", -- Use info if available
                })
              end
            end
            return commands
          end,
          -- This function defines what happens when an item is selected
          action = function(picker, item)
            if item and item.value then
              picker:close() -- Close the picker
              vim.cmd(item.value) -- Execute the selected CMake command
            end
          end,
          -- Optional: Customize the display of items in the picker
          item_format = function(item)
            return {
              { item.text, "SnacksPickerText" }, -- Style for the command name
              { " " .. item.description, "SnacksPickerHint" }, -- Style for the description
            }
          end,
          -- Optional: Keymaps for this specific picker source
          win = {
            keys = {
              -- Example: Press 'c' to open CMake commands
              -- You might want a different keybinding depending on your setup
              c = function(picker)
                picker:open_source("cmake_commands")
              end,
            },
          },
        },
      },
    },
  },
  -- Make sure this plugin loads after cmake-tools.nvim if necessary,
  -- although generally, querying commands should be fine.
  -- event = "VimEnter", -- or "VeryLazy"
  -- dependencies = { "Civitasv/cmake-tools.nvim" },
}
