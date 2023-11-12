return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        file_browser = {
          hidden = true,
          auto_depth = true,
          hijack_netrw = true,
        },
      },
    },
  },
}
