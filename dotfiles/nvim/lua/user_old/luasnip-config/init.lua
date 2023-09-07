if vim.g.snippets ~= "luasnip" then
  return
end

local ls = require "luasnip"

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/user/snippets/" })
ls.config.set_config({
  history = true,
  updateevents = "textchanged,textchangedi",
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choicenode] = {
      active = {
        virt_text = { { "-", "gruvboxorange" } },
      },
    },
  },
})
