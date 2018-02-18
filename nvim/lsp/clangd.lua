return {
   cmd = { 'clangd', '--malloc-trim', '-j', '4', '--function-arg-placeholders=false', '--all-scopes-completion=false' },
   filetypes = { 'c', 'cpp' },
   root_markers = { 'compile_commands.json', '.git' },
}
