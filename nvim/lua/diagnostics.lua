local virtual_text = {
   spacing = 2,
   source = 'if_many',
   prefix = '●',
}

vim.diagnostic.config({
   severity_sort = true,
   update_in_insert = false,
   float = {
      border = 'rounded',
      source = 'if_many',
   },
   underline = true,
   virtual_text = virtual_text,
   signs = {
      text = {
         [vim.diagnostic.severity.ERROR] = 'E',
         [vim.diagnostic.severity.WARN] = 'W',
         [vim.diagnostic.severity.INFO] = 'I',
         [vim.diagnostic.severity.HINT] = 'H',
      },
   },
})

vim.keymap.set('n', 'gK', function()
   local new_config = vim.diagnostic.config().virtual_text
   if new_config == false then
      new_config = virtual_text
   else
      new_config = false
   end
   vim.diagnostic.config({ virtual_text = new_config })
end)
