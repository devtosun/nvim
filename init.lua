-- vim.g.python3_host_prog = '/usr/bin/python3'

require("plugins.setup")

require("plugins.default")

require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.comment")
require("plugins.telescope")
require("plugins.nvim-treesitter")
require("plugins.gitsigns")

-- require("plugins.catppuccin-theme")
require("plugins.barbar")
require("plugins.nvim-surround")


-- require("plugins.nvim-cmp")


require("plugins.nvim-cmp")

require("plugins.auto-pairs")


local lspconfig = require'lspconfig'

lspconfig.gopls.setup{}
