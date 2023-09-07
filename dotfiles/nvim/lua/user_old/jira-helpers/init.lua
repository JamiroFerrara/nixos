local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local token = 'export JIRA_API_TOKEN="ATATT3xFfGF0-obuRc_PsEEfx7qpDFGYbv0AGioBywm216OEHJWxPEzosEi8egv0ZoRnzTcuqfwgJTdv3zzpueec20AxMLHUkUVjxi73tOasK0bBSz08N-BM5B9g63ceUVdDbVYz1gIWzcD1wJG5Knx-LSj7BvHQep5dFRqmm9o9xoPa-1cLp8o=AD52157F"'

local M = {}

local jira_commands = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Git Functions",
    finder = finders.new_table {
      results = { "View Jira Issue", "List Jira Issues", "List Open Jira Issues", "List Closed Jira Issues",
        "List On Hold Jira Issues",
        "List Ready For Test Jira Issues", "List In Progress Jira Issues" }
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
  local commands = jira_commands(require("telescope.themes").get_dropdown {})
  print(commands)
end

function M.functions(command)
  if command == "View Jira Issue" then M.view_jira_issue() end
  if command == "List Jira Issues" then M.list_jira_issues() end
  if command == "List Open Jira Issues" then M.list_jira_issues_open() end
  if command == "List Closed Jira Issues" then M.list_jira_issues_closed() end
  if command == "List On Hold Jira Issues" then M.list_jira_issues_on_hold() end
  if command == "List Ready For Test Jira Issues" then M.list_jira_issues_ready_for_test() end
  if command == "List In Progress Jira Issues" then M.list_jira_issues_in_progress() end
end

function M.list_jira_issues()
  vim.cmd("TermExec cmd='clear && jira issue list -a$(jira me) --order-by rank --reverse --plain'")
end

function M.view_jira_issue()
  vim.cmd("TermExec cmd='view-jira-issue'")
end

function M.list_jira_issues_open()
  vim.cmd("TermExec cmd='clear && jira issue list -a$(jira me) --order-by rank --reverse --plain -s" .. "Aperto'")
end

function M.list_jira_issues_closed()
  vim.cmd("TermExec cmd='clear && jira issue list -a$(jira me) --order-by rank --reverse --plain -s" .. "Chiuso'")
end

function M.list_jira_issues_on_hold()
  vim.cmd("TermExec cmd='clear && jira issue list -a$(jira me) --order-by rank --reverse --plain -s" .. "\"On Hold\"'")
end

function M.list_jira_issues_ready_for_test()
  vim.cmd("TermExec cmd='clear && jira issue list -a$(jira me) --order-by rank --reverse --plain -s" ..
    "\"Ready For Test\"'")
end

function M.list_jira_issues_in_progress()
  vim.cmd("TermExec cmd='clear && jira issue list -a$(jira me) --order-by rank --reverse --plain -s" .. "\"In corso\"'")
end

return M
