return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    { ']g', '<cmd>Gitsigns next_hunk<CR>', mode = 'n', desc = 'Next Git hunk' },
    { '[g', '<cmd>Gitsigns prev_hunk<CR>', mode = 'n', desc = 'Previous Git hunk' },
  },
  opts = {}
}

