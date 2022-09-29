-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opt = {
    noremap = true,
    silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>q", ":q!<CR>", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- map("n", "<F3>", ":NvimTreeToggle<CR>", opt)
map("n", "<A-F3>", ":NvimTreeFocus<CR>", opt)
map("n", "<F3>", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = "o", action = "edit" },
  { key = "<CR>", action = "edit" },
--   { key = "<CR>", action = "system_open" },
  -- v分屏打开文件
  { key = "v", action = "vsplit" },
  -- h分屏打开文件
  { key = "h", action = "split" },
  -- Ignore (node_modules)
  { key = "i", action = "toggle_ignored" },
  -- Hide (dotfiles)
  { key = ".", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  -- 文件操作
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "I", action = "toggle_file_info" },
  { key = "n", action = "tabnew" },
  -- 进入下一级
  { key = { "]" }, action = "cd" },
  -- 进入上一级
  { key = { "[" }, action = "dir_up" },
}

  -- 注释 comment
  pluginKeys.comment = {
    -- Normal 模式快捷键
    toggler = {
      line = "gcc", -- 行注释
      block = "gbc", -- 块注释
    },
    -- Visual 模式
    opleader = {
      line = "gc",
      bock = "gb",
    },
  }
  -- ctrl + /
  map("n", "<C-_>", "gcc", { noremap = false })
  map("v", "<C-_>", "gcc", { noremap = false })

return pluginKeys
  