-- Packer, manually install it:
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim \
--   ~/.config/nvim/pack/packer/start/packer.nvim
-- OR auto install packer if not installed
-- $PWD/.local/share/nvim/ + ..
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()   -- true if packer was just installed

return require("packer").startup(function()
  use "wbthomason/packer.nvim"   -- https://github.com/wbthomason/packer.nvim

  -- Look and Feel
  -- use { "catppuccin/nvim", as = "catppuccin" } -- https://github.com/catppuccin/nvim

  use { "ellisonleao/gruvbox.nvim" }

  -- Productivity
  use { "romgrk/barbar.nvim", wants = "nvim-tree/nvim-web-devicons" }   -- https://github.com/romgrk/barbar.nvim
  use "nvim-lualine/lualine.nvim"                                       -- https://github.com/nvim-lualine/lualine.nvim
  use {
    "nvim-tree/nvim-tree.lua",                                          -- https://github.com/nvim-tree/nvim-tree.lua
    requires = {
      "nvim-tree/nvim-web-devicons",                                    -- https://github.com/nvim-tree/nvim-web-devicons
    },
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",   -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    run = "make",
  }
  use {
    "nvim-telescope/telescope.nvim",   -- https://github.com/nvim-telescope/telescope.nvim
    requires = {
      "nvim-lua/plenary.nvim",
    },
    branch = "0.1.x",
  }

  -- Filetypes
  use "chrisbra/csv.vim"   -- https://github.com/chrisbra/csv.vim

  -- Development
  use "lewis6991/gitsigns.nvim"          -- https://github.com/lewis6991/gitsigns.nvim
  use {
    "nvim-treesitter/nvim-treesitter",   -- https://github.com/nvim-treesitter/nvim-treesitter
    run = ":TSUpdate"
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"   -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  use "rhysd/vim-clang-format"                        -- https://github.com/rhysd/vim-clang-format
  use "fatih/vim-go"                                  -- https://github.com/fatih/vim-go
  use "SirVer/ultisnips"                              -- https://github.com/sirver/UltiSnips
  use "hrsh7th/cmp-nvim-lsp"                          -- https://github.com/hrsh7th/cmp-nvim-lsp
  use "hrsh7th/nvim-cmp"                              -- https://github.com/hrsh7th/nvim-cmp
  use "neovim/nvim-lspconfig"                         -- https://github.com/neovim/nvim-lspconfig
  use "onsails/lspkind-nvim"                          -- https://github.com/onsails/lspkind-nvim
  use "quangnguyen30192/cmp-nvim-ultisnips"           -- https://github.com/quangnguyen30192/cmp-nvim-ultisnips
  use "williamboman/nvim-lsp-installer"               -- https://github.com/williamboman/nvim-lsp-installer
  use "numToStr/Comment.nvim"                         -- https://github.com/numToStr/Comment.nvim
  use { "kylechui/nvim-surround", tag = "*" }         -- https://github.com/kylechui/nvim-surround

  use { 'windwp/nvim-autopairs' }

  -- flutter start
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require'lspconfig'.dartls.setup{}
    end
  }

  local on_attach = function(client, bufnr)
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap=true, silent=true }
  
    -- Tanıma gitmek için kısayol: 'gd'
    buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  
    -- Uygun diğer LSP işlevlerini de buraya ekleyebilirsiniz
  end
  
  require'lspconfig'.dartls.setup{
    on_attach = on_attach,
    cmd = { "dart", "language-server", "--protocol=lsp" },
    filetypes = { "dart" },
    root_dir = require('lspconfig').util.root_pattern("pubspec.yaml"),
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      -- Tamamlama motoru ayarları buraya gelecek
    end
  }
  -- flutter end

  -- GRUVBOX
  require("gruvbox").setup({
    contrast = "hard",
    palette_overrides = {
      gray = "#2ea542", -- comments are green and by that I mean GREEN
    }
  })

  -- COLORSCHEME
  vim.cmd("colorscheme gruvbox")

  -- Adding the same comment color in each theme
  vim.cmd([[
	augroup CustomCommentCollor
		autocmd!
		autocmd VimEnter * hi Comment guifg=#2ea542
	augroup END
]])


  if packer_bootstrap then
    require("packer").sync()
  end
end)
