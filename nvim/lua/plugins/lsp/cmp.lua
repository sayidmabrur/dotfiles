local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  sources = {
    { name = 'path' },
--    { name ="buffer" },
--    { name ="nerdfont"},
    { name = 'nvim_lsp' },
    {name = "luasnip"},
        { name = 'nvim_lua' }

  },
  -- ... Your other configuration ...

  mapping = {
    -- ... Your other mappings ...
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<S-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
    ["<S-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
      -- that way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end

    end, { "i", "s" }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  -- ... Your other configuration ...
})

