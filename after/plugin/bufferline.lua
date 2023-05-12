local bufferline = require('bufferline')

bufferline.setup {
  options = {
    -- buffer_close_icon = "⤫",
    show_close_icon = false,
    numbers = "buffer_id",
    -- TODO Doesn't work
    highlights = {
      fill = {
        fg = '#FF0000',
        bg = '#00FF00'
      },
      background = {
        fg = 'red'
      }
    }
  },
}
