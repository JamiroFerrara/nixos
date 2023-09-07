require("transparent").setup({
  extra_groups = {
    'BufferLineBackground', 'BufferLineTab', 'BufferLineHint', 'BufferLineInfo', 'BufferLineBuffer',
    'BufferLineWarning', 'BufferLineTabClose', 'BufferLineDuplicate', 'BufferLineDiagnostic', 'BufferLineTabSeparator',
    'BufferLineFill', 'BufferLineSeparatorVisible', 'GlancePreviewNormal'
  },
  exclude = {}, -- table: groups you don't want to clear
})
