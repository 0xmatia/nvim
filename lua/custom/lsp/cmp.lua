-- See `:help cmp`

local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

kind_icons = {
  Text = ' ',
  Method = ' ',
  Function = '󰊕 ',
  Constructor = ' ',
  Field = ' ',
  Variable = ' ',
  Class = '󰠱 ',
  Interface = ' ',
  Module = '󰏓 ',
  Property = ' ',
  Unit = ' ',
  Value = ' ',
  Enum = ' ',
  EnumMember = ' ',
  Keyword = '󰌋 ',
  Snippet = '󰲋 ',
  Color = ' ',
  File = ' ',
  Reference = ' ',
  Folder = ' ',
  Constant = '󰏿 ',
  Struct = '󰠱 ',
  Event = ' ',
  Operator = ' ',
  TypeParameter = '󰘦 ',
  TabNine = '󰚩 ',
  Copilot = ' ',
  Unknown = ' ',
}

local function format(entry, item)
  local MAX_LABEL_WIDTH = 55
  local function whitespace(max, len) return (' '):rep(max - len) end
  -- Limit content width.
  local content = item.abbr
  if #content > MAX_LABEL_WIDTH then
      item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. '…'
  else
      item.abbr = content .. whitespace(MAX_LABEL_WIDTH, #content)
  end

  -- Replace kind with icons.
  item.kind = ' ' .. (kind_icons[item.kind] or kind_icons.Unknown) .. '│'

  -- Remove gibberish.
  item.menu = ({
    nvim_lsp = "[LSP]",
    nvim_lua = "[LUA]",
    crates = "[Crates]",
    luasnip = "[Snippet]",
    buffer = "[Buffer]",
    path = "[Path]",
    dap = "[DAP]",
})[entry.source.name]
  return item
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    format = format,
    fields = { 'kind', 'abbr', 'menu'},
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "path" },
    { name = "buffer" },
  },
}


-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
      { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources{
      { name = 'path' },
      { name = 'cmdline' }
  }
})

-- Change hover window background color to match actual background color
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
