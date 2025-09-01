return {
  {
    url = "https://codeberg.org/jthvai/lavender.nvim",
    branch = "stable",
    name = "lavender",
    priority = 1000,
    lazy = true,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lavender",
    },
  },
}
