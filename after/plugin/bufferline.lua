local bufferline = require('bufferline')

bufferline.setup {
  options = {
    style_preset = bufferline.style_preset.minimal,
    themable = true,
    numbers = "buffer_id",
  },
}
