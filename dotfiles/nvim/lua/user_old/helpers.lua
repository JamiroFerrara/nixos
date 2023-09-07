local M = {}

function M.view_jira_issue()
  os.execute("tmux split-window -h '/root/.scripts/view-jira-issue.sh'")
end

function M.search_chrome_yank()
  local yankedText = vim.fn.getreg('"');
  local formattedText = string.gsub(yankedText, " ", "%%20");
  formattedText = string.gsub(formattedText, "%(", "");
  formattedText = string.gsub(formattedText, "%)", "");
  formattedText = string.gsub(formattedText, "%?", "");
  local query = "chrome.exe https://www.google.com/search?q=" .. formattedText;
  os.execute(query)
end

function M.dotnet_run()
  os.execute("tmux neww 'dotnet run'")
  M.view_jira_issue()
  os.execute("tmux select-pane -R")
end

function M.delete_lines()
  local msg = vim.fn.input("Delete lines: ", "", "file")
  vim.api.nvim_command("g!/" .. msg .. "/d");
end

function M.publish()
  os.execute("tmux split-window -h -p 30 './publish.sh'")
  -- os.execute("tmux select-pane -L")
end

function M.ai()
  os.execute("tmux split-window -h /root/.scripts/cgpt.sh")
end

function M.aicode()
  os.execute("tmux split-window -h /root/.scripts/cgptcode.sh")
end

function M.npm_start()
  os.execute("tmux neww 'npm start'")
  M.view_jira_issue()
  os.execute("tmux select-pane -R")
end

function M.npm_start_local()
  os.execute("tmux neww 'npm start:local'")
  M.view_jira_issue()
  os.execute("tmux select-pane -R")
end

function M.dotnet_test()
  os.execute("tmux split-window -v -p 10 'echo Testing..; dotnet test | grep Passed; sleep infinity; '")
  os.execute("tmux select-pane -R")
end

function M.visualModeAi()
  local selected_text = vim.fn.escape(vim.fn.getreg("\"", 1), '\'"')
  local command = 'tmux split-window -v -p 25 sh -c "echo \'' .. selected_text .. '\' | /root/.scripts/cgptvisual.sh"'
  os.execute(command)
end

function M.cs2ts()
  local selected_text = vim.fn.escape(vim.fn.getreg("\"", 1), '\'"')
  local command = 'tmux split-window -v -p 25 sh -c "echo \'' .. selected_text .. '\' | /root/.scripts/cs2ts.sh"'
  os.execute(command)
end

return M
