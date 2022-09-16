local status, lualine = pcall(require, "lualine")
if not status then
  vim.notify("没有找到 lualine")
  return
end

lualine.setup({
  options = {
    -- 主题
    theme = "auto",
    -- 分割线
    component_separators = { left = "<", right = ">" },
  },
  sections = {
    lualine_c = {
      'lsp_progress',
    }
  }
})
