-- align_to_char(length, reverse, preview, marks)
-- align_to_string(is_pattern, reverse, preview, marks)
-- align(str, reverse, marks)
-- operator(fn, opts)
-- Where:
--      length: integer
--      reverse: boolean
--      preview: boolean
--      marks: table (e.g. {1, 0, 23, 15})
--      str: string (can be plaintext or Lua pattern if is_pattern is true)

local NS = { noremap = true, silent = true }

-- Example gawip to align a paragraph to a string, looking left and with previews
vim.keymap.set(
  'n',
  'gaw',
  function()
    local a = require 'align'
    a.operator(
      a.align_to_string,
      { is_pattern = false, reverse = true, preview = true }
    )
  end,
  NS
)

-- Example gaaip to aling a paragraph to 1 character, looking left
vim.keymap.set(
  'n',
  'gaa',
  function()
    local a = require 'align'
    a.operator(
      a.align_to_char,
      { length = 1, reverse = true }
    )
  end,
  NS
)
