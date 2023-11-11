-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
function format_prettier()
  return {
    exe = "npx",
    args = { "prettier", "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
    stdin = true
  }
end
return {
  require('formatter').setup {
    logging = true,
    filetype = {
      typescript = { format_prettier },
      typescriptreact = { format_prettier },
    },
  }
}
