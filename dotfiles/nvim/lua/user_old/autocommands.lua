-- Dadbod completion
vim.cmd("autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })")

-- On file enter try to harpoon
-- vim.api.nvim_create_autocmd("VimEnter", {
-- pattern = "*",
-- nested = true,
-- callback = function()
-- require("harpoon.ui").nav_file(1)
-- end,
-- })
--

vim.api.nvim_command("autocmd TextChanged,TextChangedI *.tsx silent write");
vim.api.nvim_command("autocmd TextChanged,TextChangedI *.md silent write");
vim.api.nvim_command("autocmd TextChanged,TextChangedI *.cs silent write");

vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.cs",
        nested = true,
        callback = function()
                -- vim.cmd("hi @type.builtin guifg=#89b4fa");
                -- vim.cmd("hi @variable guifg=#89b4fa");
                vim.cmd("hi @type.builtin guifg=#89b4fa");
                -- vim.cmd("hi @type guifg=#89b4fa");
                -- vim.cmd("hi @type guifg=#94e2d5");

                vim.cmd("hi @parameter guifg=#cdd6f4");
                vim.cmd("hi @field guifg=#cdd6f4");
                vim.cmd("hi @function guifg=#b4befe");
                vim.cmd("hi @method guifg=#b4befe");
                vim.cmd("hi @keyword guifg=#cba6f7");
                vim.cmd("hi @method.call guifg=#89b4fa");

                -- vim.cmd("hi @constant.macro guibg=#89b4fa");
                -- vim.cmd("hi @attribute guifg=#f38ba8");
        end,
})

vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.tsx",
        nested = true,
        callback = function()
                vim.cmd("hi Comment guifg=null");
        end,
})

vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.ts",
        nested = true,
        callback = function()
                vim.cmd("hi Comment guifg=null");
        end,
})
