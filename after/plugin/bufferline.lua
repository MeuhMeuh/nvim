local bufferline = require('bufferline')

bufferline.setup {
  options = {
    style_preset = bufferline.style_preset.minimal,
    themable = true,
    numbers = "buffer_id",
  },
  highlights = {
    background = {
      fg = '#65bcff',
      bg = '#1e2030',
    },
    tab = {
      fg = 'white',
      bg = 'white'
    },
    buffer_visible = {
      fg = '#71805d',
      bg = '#1e2030',
      bold = false,
    },
    buffer_selected = {
      fg = '#e2ffbb',
      bg = '#1e2030',
      bold = false,
    },
    numbers = {
      fg = '#666666',
    },
    numbers_visible = {
      fg = '#666666',
    },
    numbers_selected = {
      fg = '#666666',
    },
  },

}
