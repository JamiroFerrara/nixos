local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"


local M = {}

local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "React Helpers",
    finder = finders.new_table {
      results = { "New Component" }
    },
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        M.react_functions(selection[1])
      end)
      return true
    end,
    sorter = conf.generic_sorter(opts),
  }):find()
end

function M.commands()
  local color = colors(require("telescope.themes").get_dropdown {})
  print(color)
end

function M.react_functions(command)
  if command == "New Component" then M.new_component() end
end

function M.new_component(name)
  local fname = vim.fn.input("Filename: ", "", "file")

  os.execute('mkdir src/components')
  os.execute('mkdir src/components/' .. fname)
  local indexFile = io.open('src/components/' .. fname .. '/index.tsx', 'w')
  indexFile:write("")
  indexFile:close()

  local styleFile = io.open('src/components/' .. fname .. '/style.less', 'w')
  styleFile:write("#app{ }")
  styleFile:close()

  local globalStyleAdd = io.open('src/pages/App/style.less', 'a')
  io.output(globalStyleAdd)
  io.write("@import '/src/components/" .. fname .. "/style.less';" .. "\n")
  io.close(globalStyleAdd)
end

return M
