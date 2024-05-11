
vim.g.mapleader = ","

vim.opt.encoding = "utf-8"

vim.opt.compatible=false
vim.opt.hlsearch=true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.vb = true
vim.opt.ruler = true
vim.opt.spelllang="en_us"
vim.opt.autoindent=true
vim.opt.colorcolumn="300"
vim.opt.textwidth=300
vim.opt.mouse="a"
vim.opt.clipboard="unnamed"
vim.opt.scrollbind=false
vim.opt.wildmenu=true


vim.o.background = "dark"
-- vim.opt.guicursor = "i:block"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.swapfile = false

vim.o.hlsearch = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
--vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true




vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting



-- shift+enter ile alt satira gec
vim.api.nvim_set_keymap('i', '<S-Enter>', '<Esc>o', { noremap = true, silent = true })



-- Insert moddayken imleç hareket etmediğinde otomatik kaydetme
vim.cmd([[autocmd InsertLeave * lua vim.cmd(':silent! write')]])

-- Normal moddayken dosyadan ayrıldığınızda otomatik kaydetme
vim.cmd([[autocmd BufLeave * lua vim.cmd(':silent! write')]])

-- vim.cmd([[autocmd BufChange * lua vim.cmd(':silent! write')]])


vim.api.nvim_buf_set_keymap(0, "n", "<leader>ca", "<cmd>lua vim.api.nvim_buf_set_completion({ auto_complete = true, complete_opt = { complete_behavior = vim.api.nvim_complete_behavior.COMPLETE_OPT_COMPLETE } })<cr>", {})
vim.api.nvim_buf_set_keymap(0, "n", "<leader>cc", "<cmd>lua vim.api.nvim_buf_set_completion({ auto_complete = true })<cr>", {})
