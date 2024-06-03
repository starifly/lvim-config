## 常用快捷键

### 插件

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| &lt;leader&gt; | whichkey (键位提示弹窗) | normal |
| &lt;leader&gt;e | 	nvimtree (键位提示弹窗) | normal |
| &lt;leader&gt;f &lt;leader&gt;s | telescope (查找文件，搜索文本等) | normal |
| &lt;leader&gt;r | code_runner (运行程序) | normal |
| &lt;leader&gt;; | alpha (dashboard) | normal |
| &lt;C-\\&gt; &lt;M-1/2/3&gt; | toggleterm (终端) | normal |

### LSP

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| K | 悬停信息 | normal |
| gd &lt;C-]&gt; | 跳转到定义 | normal |
| &lt;C-o&gt; | 返回定义 | normal |
| gD | 跳转到声明 | normal |
| gr | 跳转到引用 | normal |
| gI | 跳转到实现 | normal |
| gs | 显示签名帮助 | normal |
| gl | 显示当前行诊断信息 | normal |

### 编辑

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| &lt;leader&gt;/ | 注释 | normal, visual |
| gcc | 行注释 | normal |
| gbc | 块注释 | normal |
| gc | 行注释 | visual |
| gb | 块注释 | visual |
| &lt;M-k&gt; | 向上移动行 | normal, visual |
| &lt;M-j&gt; | 向下移动行 | normal, visual |

### 补全

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| &lt;C-space&gt; | 显示补全窗口 | insert |
| &lt;CR&gt; &lt;C-y&gt; | 确认 | insert |
| &lt;C-e&gt; | 中断 | insert |
| &lt;C-k&gt; &lt;Up&gt; &lt;Tab&gt; | 上一项 | insert |
| &lt;C-j&gt; &lt;Down&gt; &lt;S-Tab&gt; | 下一项 | insert |
| &lt;C-d&gt; | 向上滚动文本 | insert |
| &lt;C-f&gt; | 向下滚动文本 | insert |
| &lt;CR&gt; &lt;Tab&gt; | 跳转到代码模版的下一个位置 | insert |
| &lt;S-Tab&gt; | 跳转到代码模版的上一个位置 | insert |

### Windows

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| &lt;Tab&gt; | 光标移到下一个窗口 | normal |
| &lt;S-Tab&gt; | 光标移到上一个窗口 | normal |
| &lt;C-h&gt; | 光标移到左窗口 | normal |
| &lt;C-j&gt; | 光标移到下窗口 | normal |
| &lt;C-k&gt; | 光标移到上窗口 | normal |
| &lt;C-l&gt; | 光标移到右窗口 | normal |
| &lt;C-Up&gt; | 减小窗口高度 | normal |
| &lt;C-Down&gt; | 增加窗口高度 | normal |
| ~~&lt;C-Left&gt;~~ | ~~减小窗口宽度~~ | ~~normal~~ |
| ~~&lt;C-Right&gt;~~ | ~~增大窗口宽度~~ | ~~normal~~ |

### Buffer

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| &lt;M-Q&gt; | 关闭buffer | normal,insert |
| &lt;C-Left&gt; | 前一个buffer | normal,insert |
| &lt;C-Right&gt; | 后一个buffer | normal,insert |

### Diagnostic

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| &lt;C-n&gt; | 前一个诊断信息 | normal |
| &lt;C-p&gt; | 后一个诊断信息 | normal |
| &lt;C-f&gt; | 在浮动窗口中打开诊断信息 | normal |
| &lt;C-q&gt; | 在quickfix中打开诊断信息 | normal |

### 折叠

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| &lt;CR&gt; | 折叠切换 | normal |
| zr | 打开所有折叠 | normal |
| zm | 折叠所有 | normal |

### 其它

| 按键 | 描述 | 模式 |
|-------|-------|-------|
| &lt;leader&gt;sr | 搜索最近打开的文件 | normal |
| &lt;leader&gt;sw | 在工作区搜索光标下的字符 | normal |
| &lt;leader&gt;sw | 在工作区搜索选中的字符 | visual |
| &lt;leader&gt;s/ | 在当前buffer模糊搜索 | normal |
| &lt;leader&gt;Rf | 在当前文件下搜索并替换 | normal |
| &lt;leader&gt;RF | 在工作区搜索并替换 | normal |
| &lt;leader&gt;Rw | 在当前文件下搜索并替换光标下的单词 | normal |
| &lt;leader&gt;RW | 在工作区搜索并替换光标下的单词 | normal |
| &lt;leader&gt;Rw | 在当前文件下搜索并替换选中的字符 | visual |
| &lt;leader&gt;RW | 在工作区搜索并替换选中的字符 | visual |
| &lt;leader&gt;h | 清除搜索结果高亮 | normal |
| &lt;leader&gt;sh | 搜索帮助文件 | normal |
| &lt;M-q&gt; | 退出所有 | normal,insert |
| &lt;M-w&gt; | 保存文件 | normal,insert |
| &lt;M-W&gt; | 保存文件并退出所有 | normal,insert |

## 使用

### TS

`:TSIstall python`

### LSP

`:LspInstall pyright`

如果要切换lsp，需要执行`:LvimCacheReset`

#### 项目配置 -- 支持clangd

c 和 c++ 语言需要借助外部工具来帮助 lsp 找到头文件和理解代码。对于 clangd 来说，可以用生成 compile_commands.json 方法来解决，这里又分为两种情况：

1.基于 CMake 项目

一是直接在命令行参数中指定，比如：

```sh
cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .
# or
# cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1
```

二是在 CMakeLists.txt 中添加：

```
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
```

2.基于 Makefile 项目

此时要生成 compile_commands.json 需要用到一个叫 Bear 的工具，用法：`bear -- make -j14`

参考：[Neovim C Cpp Lsp Integration Tips](https://ttys3.dev/blog/neovim-c-cpp-lsp-integration-tips)，[在vscode下写自己的头文件clangd会报错找不到头文件该怎么解决？
](https://www.zhihu.com/question/427250657)

### Mason

`:Mason`, python需要用mason安装ruff、black

## TODO

- chatgpt.nvim - https://www.youtube.com/watch?v=7k0KZsheLP4&list=PL05iK6gnYad1sb4iQyqsim_Jc_peZdNXf&index=5
- gp.nvim
- copilot.vim
- copilot-cmp && copilot.lua
- sg.nvim
- codium
- The perfect Neovim setup for C++：https://www.youtube.com/watch?v=lsFoZIg-oDs&list=PL05iK6gnYad1sb4iQyqsim_Jc_peZdNXf&index=6
- The perfect Neovim setup for Go：https://www.youtube.com/watch?v=i04sSQjd-qo&list=PL05iK6gnYad1sb4iQyqsim_Jc_peZdNXf&index=3
