require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "html", "cssls", "tsserver" }
})

local lspconfig = require("lspconfig")

local servers = {
    html = require("lsp.config.html"),
    cssls = require("lsp.config.css"),
    tsserver = require("lsp.config.tsserver"),
}
  
for name, config in pairs(servers) do
    if config ~= nil and type(config) == "table" then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end