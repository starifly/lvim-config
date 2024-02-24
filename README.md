## 常用快捷键

### 插件

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| <leader> | whichkey (键位提示弹窗) | normal |
| <leader>e | 	nvimtree (键位提示弹窗) | normal |
| <leader>f <leader>s | telescope (查找文件，搜索文本等) | normal |
| <leader>r | code_runner (运行程序) | normal |
| <leader>; | alpha (dashboard) | normal |
| <C-\> <M-1/2/3> | toggleterm (终端) | normal |

### LSP

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| K | 悬停信息 | normal |
| gd <C-]> | 跳转到定义 | normal |
| <C-o> | 返回定义 | normal |
| gD | 跳转到声明 | normal |
| gr | 跳转到引用 | normal |
| gI | 跳转到实现 | normal |
| gs | 显示签名帮助 | normal |
| gl | 显示当前行诊断信息 | normal |

### 编辑

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| <leader>/ | 注释 | normal, visual |
| gb | 块注释 | visual |
| <M-k> | 向上移动行 | normal, visual |
| <M-j> | 向下移动行 | normal, visual |

### 补全

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| <C-space> | 显示补全窗口 | insert |
| <CR> <C-y> | 确认 | insert |
| <C-e> | 中断 | insert |
| <C-k> <Up> <Tab> | 上一项 | insert |
| <C-j> <Down> <S-Tab> | 下一项 | insert |
| <C-d> | 向上滚动文本 | insert |
| <C-f> | 向下滚动文本 | insert |
| <CR> <Tab> | 跳转到代码模版的下一个位置 | insert |
| <S-Tab> | 跳转到代码模版的上一个位置 | insert |

### Windows

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| <Tab> | 光标移到下一个窗口 | normal |
| <S-Tab> | 光标移到上一个窗口 | normal |
| <C-h> | 光标移到左窗口 | normal |
| <C-j> | 光标移到下窗口 | normal |
| <C-k> | 光标移到上窗口 | normal |
| <C-l> | 光标移到右窗口 | normal |
| <C-Up> | 减小窗口高度 | normal |
| <C-Down> | 增加窗口高度 | normal |
| ~~<C-Left>~~ | ~~减小窗口宽度~~ | ~~normal~~ |
| ~~<C-Right>~~ | ~~增大窗口宽度~~ | ~~normal~~ |

### Buffer

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| <M-Q> | 关闭buffer | normal,insert |
| <C-Left> | 前一个buffer | normal,insert |
| <C-Right> | 后一个buffer | normal,insert |

### 其它

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| <leader>sr | 搜索最近打开的文件 | normal |
| <leader>sh | 搜索帮助文件 | normal |
| <M-q> | 退出所有 | normal,insert |
| <M-w> | 保存文件 | normal,insert |
| <M-W> | 保存文件并退出所有 | normal,insert |

## 使用

### TS

`:TSIstall python`

### LSP

`:LspInstall pylsp`

如果要切换lsp，需要执行`:LvimCacheReset`

### Mason

`:Mason`, python需要用mason安装ruff、black

## TODO

- chatgpt.nvim - https://www.youtube.com/watch?v=7k0KZsheLP4&list=PL05iK6gnYad1sb4iQyqsim_Jc_peZdNXf&index=5
- gp.nvim
- copilot.vim
- copilot-cmp && copilot.lua
- gp.nvim
- codium
- The perfect Neovim setup for C++：https://www.youtube.com/watch?v=lsFoZIg-oDs&list=PL05iK6gnYad1sb4iQyqsim_Jc_peZdNXf&index=6
- The perfect Neovim setup for Go：https://www.youtube.com/watch?v=i04sSQjd-qo&list=PL05iK6gnYad1sb4iQyqsim_Jc_peZdNXf&index=3
- 搜索结果数目显示
