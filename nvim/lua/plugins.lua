vim.api.nvim_create_autocmd('PackChanged', {
   callback = function(ev)
      local name, kind = ev.data.spec.name, ev.data.kind
      if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
         vim.system({ 'make' }, { cwd = ev.data.path }):wait()
      end
   end,
})

vim.pack.add({
   { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },

   'https://github.com/nvim-lualine/lualine.nvim',

   'https://github.com/SmiteshP/nvim-navic',

   'https://github.com/kevinhwang91/nvim-ufo',
   'https://github.com/kevinhwang91/promise-async',

   'https://github.com/tiagovla/scope.nvim',

   'https://github.com/nvim-lua/plenary.nvim',
   'https://github.com/nvim-telescope/telescope.nvim',
   'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
   'https://github.com/nvim-telescope/telescope-ui-select.nvim',

   'https://github.com/nvim-tree/nvim-web-devicons',
})

-- catppuccin

require('catppuccin').setup({
   no_italic = true,
   lsp_styles = {
      underlines = {
         errors = { 'undercurl' },
         warnings = { 'undercurl' },
      },
   },
   custom_highlights = function(colors)
      return {
         Comment = { fg = '#ffa500' },
      }
   end,
})

vim.cmd.colorscheme('catppuccin-nvim')

-- nvim-navic

require('nvim-navic').setup({
   lsp = {
      auto_attach = true,
   },
   highlight = true,
})

-- nvim-ufo

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
   dynamicRegistration = false,
   lineFoldingOnly = true
}

local language_servers = vim.lsp.get_clients()
for _, ls in ipairs(language_servers) do
   require('lspconfig')[ls].setup({
      capabilities = capabilities
   })
end

require('ufo').setup()

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'

-- lualine

local navic = require('nvim-navic')

require('lualine').setup({
   sections = {
      lualine_c = {
         {
            'filename',
            path = 1,
         },
         {
            function()
               return navic.get_location()
            end,
            cond = function()
               return navic.is_available()
            end
         },
      },
      lualine_x = {},
   },
   tabline = {
      lualine_a = { 'tabs' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
   }
})

-- scope

require('scope').setup({})

-- telescope

local actions = require('telescope.actions')
local themes = require('telescope.themes')

require('telescope').setup({
   defaults = {
      sorting_strategy = 'ascending',
      scroll_strategy = 'limit',
      layout_strategy = 'center',
      layout_config = {
         center = {
            anchor = 'S',
            height = 0.3,
            width = 0.8,
            preview_cutoff = 1,
            prompt_position = 'bottom',
         },
      },
      mappings = {
         i = {
            ['<ESC>'] = actions.close,
         },
      },
   },
   pickers = {
      buffers = {
         sort_mru = true,
      },
   },
   extensions = {
      ['ui-select'] = {
         themes.get_cursor({})
      },
   },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<CR>', builtin.buffers)
vim.keymap.set('n', 'grr', function() builtin.lsp_references({ include_current_line = true }) end)
