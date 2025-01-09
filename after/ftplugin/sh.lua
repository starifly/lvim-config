-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "bash",
}

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "shfmt", extra_args = { "-i", "2", "-ci", "-bn" }, }, }
lvim.format_on_save.pattern = { "*.sh" }

-- setup linting
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "shellcheck", filetypes = { "sh" } } }
