return {

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },

  vim.api.nvim_set_keymap(
    "n",
    "<space>E",
    ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
    { desc = "File Browser (current dir)" }
  ),
  vim.api.nvim_set_keymap("n", "<space>e", ":Telescope file_browser<cr>", { desc = "File Browser (root dir)" }),
}
