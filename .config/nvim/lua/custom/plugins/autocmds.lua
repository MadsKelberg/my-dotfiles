local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.ts" },
    desc = "Auto-format Typescript files after saving",
    callback = function()
        vim.cmd(":Format")
    end,
    group = autocmd_group,
})
