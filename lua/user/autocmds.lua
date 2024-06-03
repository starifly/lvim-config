local vim = vim

-- 保存折叠状态
vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  command = 'silent! mkview'
})

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  command = 'silent! loadview'
})

-- vim.api.nvim_create_autocmd({ 'VimResized' }, {
--   pattern = { "*.*" },
--   callback = function()
--     -- keep the size of every window, very usful!
--     vim.cmd.wincmd('=')
--   end
-- })

-- vim.api.nvim_create_autocmd('TextYankPost', {
--   callback = function()
--     vim.highlight.on_yank()
--     require('osc52').copy_register('+')
--   end
-- })

-- 自动保存同时触发格式化
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--   pattern = { "*" },
--   command = "silent! wall",
--   nested = true,
-- })

-- https://shaobin-jiang.github.io/blog/posts/neovim-shada/
vim.api.nvim_create_autocmd("CmdlineEnter", {
  once = true,
  callback = function()
    local shada = vim.fn.stdpath("state") .. "/shada/main.shada"
    vim.o.shadafile = shada
    vim.api.nvim_command("rshada! " .. shada)
  end,
})
