local M = {}

function M.go_to_glossary()
  os.execute("/root/.scripts/tmux-glossary.sh")
end

function M.go_to_wtservice()
  os.execute("/root/.scripts/tmux-wtservice.sh")
end

function M.go_to_nvim()
  os.execute("/root/.scripts/tmux-nvim.sh")
end

return M
