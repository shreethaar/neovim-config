vim.o.clipboard = 'unnamedplus'
vim.g.mapleader = ' '
vim.o.ignorecase = true
vim.o.smartcase = true

if vim.fn.has('unix') == 1 then
  vim.o.shell = '/usr/bin/bash' -- I use fish on Linux and it slow for running internal commands
end

require('auto-hlsearch').setup()
require('cutlass').setup({
  cut_key = 'm',
  exclude = { 'ns', 'nS' }, -- Use s for leap
})
require('leap').add_default_mappings()
require('nvim-surround').setup()

local substitute = require('substitute')
substitute.setup({
  highlight_substituted_text = {
    enabled = false,
  },
})

vim.keymap.set('n', '<Leader>s', substitute.operator, { noremap = true })
vim.keymap.set('n', '<Leader>ss', substitute.line, { noremap = true })
vim.keymap.set('n', '<Leader>S', substitute.eol, { noremap = true })
vim.keymap.set('x', 'p', substitute.visual, { noremap = true })

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  callback = function() vim.highlight.on_yank() end,
})

vim.keymap.set('', ']<Space>', "<Cmd>put =repeat([''],v:count)<bar>'[-1<CR>", { noremap = true })
vim.keymap.set('', '[<Space>', "<Cmd>put!=repeat([''],v:count)<bar>']+1<CR>", { noremap = true })
