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






-- Insert modda Tab tuşuna basıldığında 4 boşluk atla
-- vim.api.nvim_set_keymap('i', '<leader><Tab>', '    ', { noremap = true, silent = true })
-- echo(vim.api.nvim_replace_termcodes("<Tab>", true, true, true))
-- vim.api.nvim_del_keymap('i', '<Tab>')
-- vim.api.nvim_set_keymap('i', '<Tab>', '    ', { noremap = true, silent = true })
--

