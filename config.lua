-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.loader.enable()

-- general
-- vim.opt.relativenumber = true -- relative line numbers
-- vim.log.levels="debug"
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- colorscheme
-- lvim.colorscheme = "catppuccin-mocha"

-- 保存时自动格式化
lvim.format_on_save.enabled = true
-- 禁用自动安装lsp
-- lvim.lsp.installer.setup.automatic_installation = false

-- restore last position
local api = vim.api
local au = api.nvim_create_autocmd
local pos_group = api.nvim_create_augroup("pos_group", { clear = true })
au("BufReadPost", {
  pattern = "*",
  group = pos_group,
  command = [[
    if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        exe "normal! g`\""
    endif
    ]],
})

-- https://github.com/ojroques/nvim-osc52?tab=readme-ov-file#using-nvim-osc52-as-clipboard-provider
local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
end

vim.g.clipboard = {
  name = 'osc52',
  copy = { ['+'] = copy, ['*'] = copy },
  paste = { ['+'] = paste, ['*'] = paste },
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set('n', '<C-c>', '"+y')
-- vim.keymap.set('n', '<C-C>', '"+yy')

-- lualine settings --
-- lvim.builtin.lualine.style = "default" -- or "none"
-- -- diable lsp virtual text --
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     -- disable virtual text
--     virtual_text = true,
--     -- show signs
--     signs = true,
--     -- delay update diagnostics
--     update_in_insert = false,
--   }
-- )

-- disabling core plugins
-- lvim.builtin.which_key.active = false

reload "user.plugins"
reload "user.keymaps"
