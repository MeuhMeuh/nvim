return {
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.8',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  'folke/tokyonight.nvim',
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },
  { 'nvim-treesitter/playground' },

  { 'ThePrimeagen/harpoon' },

  { 'mbbill/undotree' },

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  },

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  'nvim-tree/nvim-web-devicons',

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },

  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },

  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end,
    opts = function()
      local dashboard = require("alpha.themes.startify")
      local logo = [[


███╗   ███╗███████╗██╗   ██╗██╗  ██╗███╗   ███╗███████╗██╗   ██╗██╗  ██╗
████╗ ████║██╔════╝██║   ██║██║  ██║████╗ ████║██╔════╝██║   ██║██║  ██║
██╔████╔██║█████╗  ██║   ██║███████║██╔████╔██║█████╗  ██║   ██║███████║
██║╚██╔╝██║██╔══╝  ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ██║   ██║██╔══██║
██║ ╚═╝ ██║███████╗╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗╚██████╔╝██║  ██║
╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝


    ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      return dashboard
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  -- Saving session per directory
  { "rmagatti/auto-session" },
  -- Center buffer
  { "folke/zen-mode.nvim" },
}
