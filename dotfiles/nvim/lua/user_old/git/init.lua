local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function split(s, sep)
  local fields = {}

  local sep = sep or " "
  local pattern = string.format("([^%s]+)", sep)
  string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)

  return fields
end

local M = {}

local git_commands = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Git Functions",
    finder = finders.new_table {
      results = { "Git Branch Commit", "Git Commit", "Git Commit History", "Git Status", "Git Blame", "Git Branches",
        "Lazygit",
        "Git Flow Feature", "Git Flow Finish Feature" }
    },
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        M.functions(selection[1])
      end)
      return true
    end,
    sorter = conf.generic_sorter(opts),
  }):find()
end

function M.commands()
  local commands = git_commands(require("telescope.themes").get_dropdown {})
  print(commands)
end

function M.functions(command)
  if command == "Git Branch Commit" then M.git_branch_commit() end
  if command == "Git Commit" then M.git_commit() end
  if command == "Git Commit History" then M.git_commit_history() end
  if command == "Git Status" then M.git_status() end
  if command == "Git Blame" then M.git_blame() end
  if command == "Git Branches" then M.git_branches() end
  if command == "Lazygit" then M.git_lazygit() end
  if command == "Git Flow Feature" then M.git_flow_feature() end
  if command == "Git Flow Finish Feature" then M.git_flow_finish_feature() end
end

function M.git_commit()
  local msg = vim.fn.input("Message: ", "", "file")
  os.execute("git add --all")
  os.execute("git commit -m '" .. msg .. "'")
end

function M.git_branch_commit()
  local handle = io.popen("git branch --show-current")
  local current_branch = handle:read("*a")
  handle:close()

  local id = split(current_branch, "/")
  -- current_branch = id[0]

  local msg = vim.fn.input(current_branch .. "->", "", "file")
  os.execute("git add --all")
  os.execute("git commit -m '" .. current_branch .. "- " .. msg .. "'")
end

function M.git_commit_history()
  require("telescope.builtin").git_commits()
end

function M.git_status()
  require("telescope.builtin").git_status()
end

function M.git_blame()
  require("gitsigns").blame_line()
end

function M.git_branches()
  require("telescope.builtin").git_branches()
end

function M.git_lazygit()
  local toggle_term_cmd = astronvim.toggle_term_cmd
  toggle_term_cmd "lazygit"
end

function M.git_flow_feature()
  vim.cmd("TermExec cmd='git-flow-jira-feature && exit'")
end

function M.git_flow_finish_feature()
  local handle = io.popen("git rev-parse --abbrev-ref HEAD")
  local result = handle:read("*a")
  handle:close()

  os.execute("git flow feature finish " .. result:sub(9))
  print(result:sub(9))
end

return M
