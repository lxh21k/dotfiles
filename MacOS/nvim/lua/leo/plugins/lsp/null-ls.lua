local setup, null_ls = pcall(require, "null_ls")
if not setup then
    return
end

local formatting = null_ls.buildins.formatting -- to setup formatters
local diagnostics = null_ls.buildins.diagnostics -- to setup linters

null_ls.setup({
    sources = {
        formatting.prettier,
        formatting.stylua,
        diagnostics.eslint_d
    }
}) 
