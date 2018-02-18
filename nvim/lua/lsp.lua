vim.lsp.log.set_level(vim.log.levels.OFF)

vim.lsp.config('clangd', {
   settings = {
      clangd = {
         InlayHints = {
            Designators = true,
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = true,
         },
      },
   },
})

vim.lsp.config('*', {
   flags = {
      debounce_text_changes = 300,
   },
})

vim.lsp.enable({
   'clangd',
})

vim.api.nvim_create_autocmd('LspAttach', {
   callback = function(args)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client:supports_method("textDocument/inlayHint") then
         vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
      end

      vim.keymap.set("n", "<leader>ih", function()
         local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
         vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = 0 })
      end)
   end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
   pattern = "*",
   callback = function()
      vim.cmd("checktime")
   end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
   pattern = "*",
   callback = function(args)
      local bufnr = args.buf
      if not vim.api.nvim_buf_is_valid(bufnr) then return end

      local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
      if is_enabled then
         vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })

         vim.defer_fn(function()
            if vim.api.nvim_buf_is_valid(bufnr) then
               vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
         end, 100)
      end
   end,
})
