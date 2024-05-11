local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),        
    },
    formatting = {
        format = lspkind.cmp_format({with_text = false, maxwidth = 200})
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
})
