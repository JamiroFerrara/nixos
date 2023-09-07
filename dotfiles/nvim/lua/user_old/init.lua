--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

        -- Configure AstroNvim updates
        updater = {
                remote = "origin", -- remote to use
                channel = "stable", -- "stable" or "nightly"
                version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main", -- branch name (NIGHTLY ONLY)
                commit = nil, -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false, -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false, -- automatically reload and sync packer after a successful update
                auto_quit = false, -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },

        -- Set colorscheme to use
        colorscheme = "catppuccin",

        -- Add highlight groups in any theme
        highlights = {
                init = function()
                        -- get highlights from highlight groups
                        local text = astronvim.get_hlgroup("@text").fg
                        local purple = astronvim.get_hlgroup("@field").fg
                        local lightgreen = astronvim.get_hlgroup("@punctuation.special").fg
                        local red = astronvim.get_hlgroup("Error").fg
                        local gray = astronvim.get_hlgroup("@text.todo.unchecked").fg
                        local orange = astronvim.get_hlgroup("@attribute").fg
                        local blue = astronvim.get_hlgroup("@function").fg
                        local bluebg = astronvim.get_hlgroup("@text.note").bg
                        local bluebgfg = astronvim.get_hlgroup("@text.note").fg
                        -- local normal = astronvim.get_hlgroup "Normal"
                        -- local fg, bg = normal.fg, normal.bg
                        -- local bg_alt = astronvim.get_hlgroup("Visual").bg
                        -- local green = astronvim.get_hlgroup("String").fg
                        -- local red = astronvim.get_hlgroup("Error").fg
                        -- return a table of highlights for telescope based on colors gotten from highlight groups
                        return {
                                LineNr = { fg = gray },
                                CursorLineNr = { fg = purple },
                                -- Todo = { fg = bluebg },
                                -- VimWikiTodo = { fg = bluebgfg, bg = bluebg },
                                VimWikiH2Folding = { fg = bluebgfg, bg = bluebg },
                                VimWikiComment = { fg = bluebgfg, bg = bluebg },
                                -- VimWikiListTodo = { fg = blue },
                                VimWikiHeaderChar = { fg = lightgreen },
                                VimWikiList = { fg = blue },

                                -- @type2.builtin = { fg = bluebgfg, bg = bluebg },

                                -- TelescopeBorder = { fg = bg_alt, bg = bg },
                                -- TelescopeNormal = { bg = bg },
                                -- TelescopePreviewBorder = { fg = bg, bg = bg },
                                -- TelescopePreviewNormal = { bg = bg },
                                -- TelescopePreviewTitle = { fg = bg, bg = green },
                                -- TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },

                                -- TelescopePromptNormal = { fg = fg, bg = bg_alt },
                                -- TelescopePromptPrefix = { fg = red, bg = bg_alt },
                                -- TelescopePromptTitle = { fg = bg, bg = red },
                                -- TelescopeResultsBorder = { fg = bg, bg = bg },
                                -- TelescopeResultsNormal = { bg = bg },
                                -- TelescopeResultsTitle = { fg = bg, bg = bg },
                        }
                end,
        },

        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        expandtab = true,
                        shiftwidth = 2,
                        tabstop = 2,
                        hidden = true,
                        relativenumber = true,
                        number = true,
                        termguicolors = true,
                        spell = true,
                        title = true,
                        ignorecase = true,
                        smartcase = true,
                        list = true,
                        scrolloff = 15,
                        sidescrolloff = 15,
                        splitright = true,
                        confirm = true,
                        exrc = true,
                        backup = false,
                        autoindent = true,
                        softtabstop = -1,
                        textwidth = 80,
                        splitbelow = true,
                        hlsearch = true,
                        incsearch = true,
                        clipboard = "unnamedplus",
                        laststatus = 2,
                },
                g = {
                        copilot_proxy_strict_ssl = false,
                        noswapfile = true,
                },
                api = {
                        bufferline_auto_hide = 1,
                        noruler = true,
                        autoread = true,
                        noshowmode = true,
                        nofixendofline = true,
                        nostartofline = true,
                        shiftround = true,
                        backspace = "indent, eol, start",
                        backupdir = "~/.local/share/nvim/backup//",
                        nojoinspaces = true,
                        wildmode = "longest:full,full",
                        mouse = "a",
                        undofile = true,
                        noswapfile = true,
                        nospell = true,
                        foldmethod = "syntax",
                        foldnestmax = 1,
                        foldlevel = 3,
                        nofoldenable = true,
                }
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = {
                [[                                  __                ]],
                [[     ___     ___    ___   __  __ /\_\    ___ ___    ]],
                [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        },

        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = "#abb2bf",
                        bg = "#1e222a",
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        local C = require "default_theme.colors"

                        hl.Normal = { fg = C.fg, bg = C.bg }

                        -- New approach instead of diagnostic_style
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = true,
                        ["neo-tree"] = true,
                        notify = false,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        treesitter = true,
                        vimwiki = true,
                        ["which-key"] = true,
                },
        },

        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },

        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = true, -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        -- example for addings schemas to yamlls
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                        --   settings = {
                        --     yaml = {
                        --       schemas = {
                        --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                        --       },
                        --     },
                        --   },
                        -- },
                },
        },

        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        ["<leader>yy"] = { 'GVggy<cmd>q!<CR>' },
                        ["|"] = { '1' },
                        ["?"] = { '2' },
                        ["&"] = { '3' },
                        ["/"] = { '4' },
                        ["="] = { '6' },
                        ["["] = { '7' },
                        ["]"] = { '8' },
                        ["@"] = { '9' },
                        ["à"] = { '0' },

                        ["<leader>dd"] = { '<cmd>lua require("user.helpers").delete_lines()<CR>' },
                        ["<leader>tt"] = { '<cmd>TransparentToggle<cr>' },
                        ["<leader>j"] = { '<cmd>Telescope jumplist<cr>' },

                        --  Fugitive
                        ["<leader>gg"] = { '<cmd>Git<cr>' },
                        ["<leader>gl"] = { '<cmd>lua os.execute("tmux neww git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit")<cr>' },
                        ["<leader>gp"] = { '<cmd>lua os.execute("tmux split-window -v -p 30 git pull")<cr>' },
                        ["<leader>gP"] = { '<cmd>lua os.execute("tmux split-window -v -p 30 git push")<cr>' },

                        ["+"] = { '<cmd>e#<cr>' },
                        ["<leader><leader>i"] = { '<cmd>IconPickerNormal<cr>' },

                        ["<leader>aa"] = { '<cmd>AerialToggle!<CR>' },
                        ["<leader>ai"] = { '<cmd>lua require("user.helpers").aicode()<CR>' },
                        ["<leader>aI"] = { '<cmd>lua require("user.helpers").ai()<CR>' },
                        ["<leader>av"] = { '<cmd>lua require("user.helpers").visualModeAi()<CR>' },
                        ["<leader>am"] = { '<cmd>lua require("user.helpers").apiMockAi()<CR>' },
                        ["<leader>at"] = { '<cmd>lua require("user.helpers").cs2ts()<CR>' },

                        ["<leader>m"] = { '<cmd>lua require("harpoon.mark").add_file()<cr>' },
                        ["<leader>M"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>' },
                        ["<leader>1"] = { '<cmd>lua require("harpoon.ui").nav_file(1)<cr>' },
                        ["<C-w>"] = { '<cmd>lua require("harpoon.ui").nav_file(1)<cr>' },
                        ["<leader>2"] = { '<cmd>lua require("harpoon.ui").nav_file(2)<cr>' },
                        ["<C-e>"] = { '<cmd>lua require("harpoon.ui").nav_file(2)<cr>' },
                        ["<leader>3"] = { '<cmd>lua require("harpoon.ui").nav_file(3)<cr>' },
                        ["<C-r>"] = { '<cmd>lua require("harpoon.ui").nav_file(3)<cr>' },
                        ["<leader>4"] = { '<cmd>lua require("harpoon.ui").nav_file(4)<cr>' },

                        -- ["|"] = { ':lua require("harpoon.ui").nav_file(1)<cr>' },
                        -- ["?"] = { ':lua require("harpoon.ui").nav_file(2)<cr>' },
                        -- ["&"] = { ':lua require("harpoon.ui").nav_file(3)<cr>' },
                        -- ["/"] = { ':lua require("harpoon.ui").nav_file(4)<cr>' },
                        -- ["<leader>a"] = { ':lua require("harpoon.ui").nav_file(1)<cr>' },
                        -- ["<leader>s"] = { ':lua require("harpoon.ui").nav_file(2)<cr>' },
                        -- ["<leader>d"] = { ':lua require("harpoon.ui").nav_file(3)<cr>' },
                        -- ["<leader>f"] = { ':lua require("harpoon.ui").nav_file(4)<cr>' },
                        --
                        ["ciu"] = { 'ci{' },
                        ["diu"] = { 'di{' },
                        ["viu"] = { 'vi{' },
                        ["cau"] = { 'ca{' },
                        ["dau"] = { 'da{' },
                        ["vau"] = { 'va{' },

                        ["ci2"] = { 'ci"' },
                        ["di2"] = { 'ci"' },
                        ["vi2"] = { 'vi"' },
                        ["ca2"] = { 'ca"' },
                        ["da2"] = { 'ca"' },
                        ["va2"] = { 'va"' },

                        ["cij"] = { 'ci[' },
                        ["dij"] = { 'di[' },
                        ["vij"] = { 'vi[' },
                        ["caj"] = { 'ca[' },
                        ["daj"] = { 'da[' },
                        ["vaj"] = { 'va[' },

                        ["<leader><cr>"] = { '<cmd>VimwikiToggleListItem<cr>' },

                        ["<leader>p"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>" },
                        ["è"] = { "p", desc = "" },
                        ["ò"] = { "&", desc = "" },

                        ["ga"] = { "%", desc = "" },
                        ["N"] = { "Nzzzv", desc = "" },
                        ["U"] = { ":redo<cr>", desc = "" },
                        ["Y"] = { "y$", desc = "" },
                        ["n"] = { "nzzzv", desc = "" },
                        ["{"] = { ":AerialNext<cr>", desc = "" },
                        ["gj"] = { ":AerialNext<cr>", desc = "" },
                        ["}"] = { ":AerialPrev<cr>", desc = "" },
                        ["gk"] = { ":AerialPrev<cr>", desc = "" },
                        ["J"] = { "}", desc = "" },
                        ["K"] = { "{", desc = "" },
                        ["ç"] = { "J", desc = "" },
                        ["f"] = { "", desc = "" },
                        ["F"] = { "", desc = "" },
                        -- ["f"] = { "/", desc = "" }, --Temp
                        ["<leader>oo"] = { "za", desc = "" },
                        -- ["+"] = { "za", desc = "" },
                        ["<leader>oc"] = { "<cmd>AerialTreeSyncFolds<cr>zRzm", desc = "" },
                        ["<leader>oa"] = { "<cmd>AerialTreeSyncFolds<cr>zRjk", desc = "" },
                        ["<leader>P"] = { ":Prettier<cr>", desc = "" },

                        -- Builds
                        ["<leader>bd"] = { "<cmd>lua require('user.helpers').dotnet_run()<cr>", desc = "dotnet run" },
                        ["<leader>bt"] = { '<cmd>lua require("user.helpers").dotnet_test()<CR>' },
                        ["<leader>bn"] = { "<cmd>lua require('user.helpers').npm_start()<cr>", desc = "npm start" },
                        ["<leader>bp"] = { "<cmd>lua require('user.helpers').publish()<cr>", desc = "npm start" },
                        ["<leader>bl"] = { "<cmd>lua require('user.helpers').npm_start_local()<cr>",
                                desc = "npm start:local" },

                        -- ["<C-t>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle term float" },
                        ["<C-t>"] = { "<cmd>e TODO.md<cr>", desc = "Edit TODO.md" },
                        ["<C-g>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "toggle term bottom" },

                        --Telescope j
                        ["<C-p>"] = { "<cmd>Telescope find_files<cr>", desc = "" },
                        -- ["gr"] = { "<cmd>Telescope lsp_references<cr>", desc = "" },
                        ["gr"] = { "<cmd>Glance references<cr>", desc = "" },
                        ["<leader>fb"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "" },
                        ["<leader>ft"] = { "<cmd>TodoTelescope<cr>", desc = "" },
                        ["<C-f>"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "" },
                        ["<leader>xx"] = { "<cmd>Telescope diagnostics<cr>", desc = "" },
                        ["<leader>lx"] = { "<cmd>TroubleToggle<cr>", desc = "" },
                        ["<leader>lc"] = { "<cmd>lua vim.diagnostic.open_float()<cr><cmd>lua vim.diagnostic.open_float()<cr>wwy$<cmd>sleep 10ms<cr><cmd>:q<cr><cmd>lua require('user.helpers').search_chrome_yank()<cr>",
                                desc = "" },
                        ["<leader>le"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "" },
                        ["<A-e>"] = { "<cmd>Trouble<cr><cmd> lua require('trouble').next({skip_groups = true, jump = true})<cr>",
                                desc = "" },
                        ["<A-w>"] = { "<cmd>Trouble<cr><cmd> lua require('trouble').previous({skip_groups = true, jump = true})<cr>",
                                desc = "" },
                        ["<leader>lj"] = { "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",
                                desc = "" },
                        ["<leader>X"] = { "<cmd>Telescope diagnostics<cr>", desc = "" },

                        --Custom Telescope
                        ["<leader>hr"] = { "<cmd>lua require('user/react-helpers').commands()<cr>", desc = "" },
                        ["<leader>hg"] = { "<cmd>lua require('user/git').commands()<cr>", desc = "" },
                        ["<leader>hj"] = { "<cmd>lua require('user/jira-helpers').commands()<cr>", desc = "" },

                        ["<C-j>"] = { "<C-w>j", desc = "" },
                        ["<C-h>"] = { "<C-w>h", desc = "" },
                        ["<C-k>"] = { "<C-w>k", desc = "" },
                        ["<C-l>"] = { "<C-w>l", desc = "" },

                        ["<A-s>"] = { ":vsp<cr>:sleep 50m<cr><C-o>", desc = "" },
                        ["<leader>wv"] = { ":vsp<cr>:sleep 50m<cr><C-o>", desc = "" },
                        ["<A-S>"] = { ":sp<cr>:sleep 50m<cr><C-o>", desc = "" },
                        ["<leader>wh"] = { ":sp<cr>:sleep 50m<cr><C-o>", desc = "" },

                        ["'"] = { "$", desc = "" },
                        -- ["<leader>a"] = { "/(<cr>/)<cr>?(<cr>a", desc = "" },
                        ["0"] = { "^", desc = "" },
                        ["t"] = { "f", desc = "" },
                        ["T"] = { "t", desc = "" },
                        ["<leader>0"] = { "f=w", desc = "" },
                        ["<leader>="] = { "F=F=w", desc = "" },
                        ["caè"] = { "ca{", desc = "" },
                        ["ciè"] = { "ci{", desc = "" },
                        ["vaè"] = { "va{", desc = "" },
                        ["viè"] = { "vi{", desc = "" },
                        ["ci8"] = { "ci(", desc = "" },
                        ["va8"] = { "va(", desc = "" },
                        ["vi8"] = { "vi(", desc = "" },
                        ["ca8"] = { "ca(", desc = "" },
                        ["tè"] = { "f{", desc = "" },
                        ["Tè"] = { "{", desc = "" },
                        ["vw"] = { "ve", desc = "" },
                        ["vtè"] = { "vt{", desc = "" },
                        ["vt8"] = { "vt(", desc = "" },
                        [","] = { ":", desc = "" },
                        ["<bs>"] = { "b", desc = "" },
                        ["<esc>"] = { "0", desc = "" },
                        ["s"] = { "/", desc = "" },
                        ["Q"] = { "@", desc = "" },
                        ["<leader><leader>"] = { "@", desc = "" },
                        -- ["<C-r>"] = { ":e<cr>", desc = "" },
                        ["X"] = { "s", desc = "" },
                        ["<leader>se"] = { '<cmd>lua require("luasnip.loaders").edit_snippet_files()<cr><cr>")',
                                desc = "" },
                        ["<leader>ip"] = { "<cmd>IconPickerNormal<cr>", desc = "" },
                        ["<leader>sf"] = { "<cmd>SessionManager! load_session<cr> ", desc = "" },
                },
                t = {
                        ["è"] = { "p", desc = "" },
                        -- ["ò"] = { "&", desc = "" },

                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                        --
                        ["<esc>"] = { "<C-\\><C-n>:q<cr>", desc = "" },
                        ["<A-s>"] = { "<cmd>2ToggleTerm<cr>", desc = "" },
                        ["<C-s>"] = { "<cmd>2ToggleTerm<cr>", desc = "" },
                        ["<leader>q"] = { "<C-\\><C-n>:q<cr>", desc = "" },
                        ["q"] = { "<C-\\><C-n>:q<cr>", desc = "" },
                        ["j"] = false,
                        ["<C-^M>"] = { "<NL>", desc = "" },

                        ["<A-q>"] = { "<C-\\><C-n>:q<cr>", desc = "" },
                        ["<C-t>"] = { "<C-\\><C-n>:q<cr>", desc = "" },
                        ["<C-g>"] = { "<C-\\><C-n>:q<cr>", desc = "" },

                        ["<C-j>"] = { "<NL>", desc = "" },
                        ["<C-h>"] = { "<Cmd>wincmd h<cr><C-\\><C-n>i", desc = "" },
                        ["<C-k>"] = { "<Cmd>wincmd k<cr>", desc = "" },
                        ["<C-l>"] = { "<Cmd>wincmd l<cr><C-\\><C-n>i", desc = "" },
                },
                v = {
                        ["|"] = { '1' },
                        ["?"] = { '2' },
                        ["&"] = { '3' },
                        ["/"] = { '4' },
                        ["="] = { '6' },
                        ["["] = { '7' },
                        ["]"] = { '8' },
                        ["@"] = { '9' },
                        ["à"] = { '0' },

                        ["<leader>av"] = { 'y<cmd>lua require("user.helpers").visualModeAi()<CR>' },

                        ["<leader>al"] = { '<cmd>lua require "align".align_to_char(1, true)<cr>' },
                        ["<leader>as"] = { '<cmd>lua require "align".align_to_char(2, true, true)<cr>' },
                        ["<leader>aw"] = { '<cmd>lua require "align".align_to_string(false, true, true)<cr>' },
                        ["<leader>ar"] = { '<cmd>lua require "align".align_to_string(true, true, true)<cr>' },

                        ["è"] = { "p", desc = "" },
                        -- ["ò"] = { "&", desc = "" },

                        ["<"] = { "<gv", desc = "" },
                        [">"] = { ">gv", desc = "" },
                        ["ga"] = { "%", desc = "" },
                        ["gA"] = { "%%", desc = "" },
                        ["y"] = { "myy`y", desc = "" },
                        ["Y"] = { "myY`y", desc = "" },
                        [","] = { "<cmd>Telescope commands<cr>", desc = "" },
                        -- ["8"] = { 'xi()<esc>hp', desc = "" },
                        -- ["2"] = { 'xi""<esc>hp', desc = "" },
                        ["'"] = { "xi''<esc>hp", desc = "" },
                        ["{"] = { "xi{}<esc>hp", desc = "" },
                        -- - ["="] = { "xi==  ==<esc>hhhp", desc = "" },
                },
                i = {
                        -- ["."] = { "<cmd>lua require 'cmp'.mapping.confirm<cr>.", desc = "" },
                        ["<C-o>"] = { "<esc><C-o>", desc = "" },
                        ["<C-i>"] = { "<esc><C-i>", desc = "" },
                        ["<c-j>"] = { "<cmd>lua require'luasnip'.jump(1)<cr>", desc = "" },
                        -- ["<c-l>"] = { "<cmd>lua require'luasnip'.jump(1)<cr>", desc = "" },
                        ["<c-k>"] = { "<cmd>lua require'luasnip'.jump(-1)<cr>", desc = "" },

                        -- ["<c-l>"] = { "<right>", desc = "" },
                        -- ["<c-h>"] = { "<left>", desc = "" },
                        -- ["<c-h>"] = { "<cmd>lua require'luasnip'.jump(-1)<cr>", desc = "" },

                        -- ["<C-n>"] = { '<Plug>luasnip-next-choice' },
                        -- ["<C-p>"] = { '<Plug>luasnip-next-choice' },

                        -- ["<C-l>"] = { "<esc>a", desc = "" },
                        -- ["<c-l>"] = { "<cmd>wincmd l<cr>", desc = "" },
                        -- ["<c-h>"] = { "<cmd>wincmd h<cr>", desc = "" },

                        ["è"] = { "p", desc = "" },
                        ["ò"] = { "#", desc = "" },

                        ["jj"] = { "<esc>", desc = "" },
                        ["JJ"] = { "<esc>", desc = "" },
                        ["kj"] = { "<esc>", desc = "" },
                        ["jJ"] = { "<esc><cmd>w!<cr>", desc = "" },
                        ["jp"] = { "<esc>:q!<cr>", desc = "" },
                        ["jk"] = { "<esc>A", desc = "" },
                        ["jK"] = { "<esc>A<space>", desc = "" },
                        ["jè"] = { "<esc>A{<enter><esc>ddO", desc = "" },
                        ["ji"] = { "<esc>I<space>", desc = "" },
                        ["jI"] = { "<esc>I", desc = "" },
                        ["<C-s>"] = { "<cmd>w<cr><esc>", desc = "" },
                        ["<C-S>"] = { "<cmd>noa w<cr><esc>", desc = "" },
                        ["jo"] = { "<esc>o", desc = "" },
                        ["jO"] = { "<esc>ko", desc = "" },
                        ["jy"] = { "<esc>yy<esc>p", desc = "" },
                        ["jd"] = { "<esc>dd", desc = "" },
                        ["jl"] = { "<esc>la", desc = "" },
                        ["jf"] = { "<esc>A<space>from<space>", desc = "" },
                        ["j0"] = { "<esc>A<space>=<space>", desc = "" },
                        ["§"] = { "`", desc = "" },
                        [";;"] = { "<esc>A;<esc>", desc = "" }
                }
        },

        -- Configure plugins
        plugins = {
                -- init = {
                        -- You can disable default plugins as follows:
                        -- ["folke/todo-comments.nvim"] = { require('user.comments') },
                        -- ["kwakzalver/duckytype.nvim"] = { require('user.duckytype') },
                        -- ["Vonr/align.nvim"] = { require('user.align') },
                        -- ["DNLHC/glance.nvim"] = { require('user.glance') },
                        -- ["j-hui/fidget.nvim"] = { require('user.fidget') },
                        -- ["nacro90/numb.nvim"] = { require('user.numb') },
                        -- ["gen740/SmoothCursor.nvim"] = { require('user.smoothcursor') },
                        -- ["kevinhwang91/nvim-bqf"] = { require('user.bqf') },
                        -- ["tpope/vim-dadbod"] = { disable = false },
                        -- ["kristijanhusak/vim-dadbod-ui"] = { disable = false },
                        -- ["kristijanhusak/vim-dadbod-completion"] = { disable = false },
                        -- ["catppuccin/nvim"] = { as = "catppuccin" },
                        -- ["nvim-treesitter/playground"] = {},
                        -- ["folke/zen-mode.nvim"] = {},
                        -- ["aserowy/tmux.nvim"] = { config = function() return require("tmux").setup() end },
                        -- ['Mofiqul/dracula.nvim'] = {},
                        -- ['xiyaowong/nvim-transparent'] = {},
                        -- ["max397574/better-escape.nvim"] = { disable = true },
                        -- ["github/copilot.vim"] = {},
                        -- ["shaunsingh/nord.nvim"] = { commit = "78f5f001709b5b321a35dcdc44549ef93185e024", },
                        -- ["projekt0n/github-nvim-theme"] = {},
                        -- ["ThePrimeagen/harpoon"] = {},
                        -- ["vimwiki/vimwiki"] = {},
                        -- ['ggandor/lightspeed.nvim'] = {},
                        -- ["ziontee113/icon-picker.nvim"] = { require("icon-picker").setup({ disable_legacy_commands = true }), },
                        -- ['gelguy/wilder.nvim'] = { require("user.wilder") },
                        -- ['roxma/nvim-yarp'] = { cmd = { "pip install -r requirements.txt", } },
                        -- ['haya14busa/is.vim'] = {},
                        -- ['gbprod/substitute.nvim'] = {},
                        -- ['folke/trouble.nvim'] = {},
                -- },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                -- ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        -- config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        -- }
                        -- return config -- return final config table
                -- end,
                -- treesitter = { -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                -- },
                -- use mason-lspconfig to configure LSP installations
                -- ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                -- },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                -- ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                -- },
                -- ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
                        -- ensure_installed = { "python" },
                -- },
        },

        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                lua = {
                        paths = { "/root/.config/nvim/lua/user/lua-snippets/" },
                },
                snipmate = {
                        paths = { "/root/.config/nvim/lua/user/snipmate-snippets/" }
                }
        },

        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        luasnip = 1000,
                        nvim_lsp = 750,
                        buffer = 500,
                        path = 250,
                },
        },

        -- Customize Heirline options
        heirline = {
                -- -- Customize different separators between sections
                -- separators = {
                --   tab = { "", "" },
                -- },
                -- -- Customize colors for each element each element has a `_fg` and a `_bg`
                -- colors = function(colors)
                --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
                --   return colors
                -- end,
                -- -- Customize attributes of highlighting in Heirline components
                -- attributes = {
                --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
                --   git_branch = { bold = true }, -- bold the git branch statusline component
                -- },
                -- -- Customize if icons should be highlighted
                -- icon_highlights = {
                --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
                --   file_icon = {
                --     winbar = false, -- Filetype icon in the winbar inactive windows
                --     statusline = true, -- Filetype icon in the statusline
                --   },
                -- },
        },

        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["b"] = { name = "Buffer" },
                                },
                        },
                },
        },

        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                require('user.autocommands')
        end,
}

vim.api.nvim_command("nnoremap <expr> k (v:count > 1 ? \"m'\" . v:count : '') . 'k'");
vim.api.nvim_command("nnoremap <expr> j (v:count > 1 ? \"m'\" . v:count : '') . 'j'");

-- require('user.transparent')
-- require('user.catpuccin')
-- require('user.lightspeed')
-- require('user.dap')
-- require('user.helpers')
-- require('user.gitsigns')
-- require("notify").setup({ background_colour = "#000000" })
-- vim.api.nvim_command("let g:copilot_proxy_strict_ssl = v:false");

return config
