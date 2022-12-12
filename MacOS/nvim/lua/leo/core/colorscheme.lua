local status, _ = pcall(vim.cmd, "colorscheme gruvbox") -- nightfly \ gruvbox \ nord
if not status then
    print("Colorscheme not found!")
    return
end
