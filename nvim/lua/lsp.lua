vim.lsp.log.set_level(vim.log.levels.OFF)

vim.lsp.enable({
   'clangd',
})

vim.lsp.config('*', {
   flags = {
      debounce_text_changes = 300,
   },
})

vim.api.nvim_create_autocmd('LspAttach', {
   callback = function(args)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
   end,
})
