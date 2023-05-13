local bufferline = require('bufferline')

bufferline.setup {
  options = {
    style_preset = bufferline.style_preset.minimal,
    themable = true,
  },
  highlights = {
    background = {
      fg = '#65bcff',
    },
    tab = {
      fg = 'white',
      bg = 'white'
    },
    buffer_visible = {
      fg = '#71805d',
      bold = false,
    },
    buffer_selected = {
      fg = '#e2ffbb',
      bold = false,
    },
  }
}
