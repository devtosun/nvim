local pairs = require('nvim-autopairs')

pairs.setup({
  pairs = {
    { '{', '}' }, -- Köşeli parantez
    { '(', ')' }, -- Parantez
    { '"', '"' }, -- Çift tırnak işareti
    { "'", "'" }, -- Tek tırnak işareti
    -- ... diğer çift karakterler
  },
})
