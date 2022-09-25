-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    paccker_bootstrap =
        fn.system(
        {
            "git",
            "clone",
            "--depth",
            "1", 
            "https://github.com/wbthomason/packer.nvim",
            install_path
        }
    )

    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("没有安装 packer.nvim")
    return
end

packer.startup(
    {
        function(use)
            -- Packer 可以升级自己
            use("wbthomason/packer.nvim")
            -------------------------- plugins -------------------------------------------
            -- nvim-tree
            use({
                "kyazdani42/nvim-tree.lua",
                requires = "kyazdani42/nvim-web-devicons",
            })
            -- bufferline
            use({
                "akinsho/bufferline.nvim",
                requires = { "kyazdani42/nvim-web-devicons" },
            })
            -- lualine
            use({
                "nvim-lualine/lualine.nvim",
                requires = { "kyazdani42/nvim-web-devicons" },
            })
            use("arkav/lualine-lsp-progress")
            -- telescope
            use({
                "nvim-telescope/telescope.nvim",
                requires = { "nvim-lua/plenary.nvim" },
            })
             -- telescope extensions
            use("LinArcX/telescope-env.nvim")
            use("nvim-telescope/telescope-ui-select.nvim")
            -- dashboard-nvim
            use("glepnir/dashboard-nvim")
            -- project
            use("ahmedkhalf/project.nvim")
            -- indent-blankline
            use("lukas-reineke/indent-blankline.nvim")





            --------------------- colorschemes --------------------
            use("navarasu/onedark.nvim")


            
            --------------------- LSP --------------------
            use({ "williamboman/mason.nvim" })
            use({ "williamboman/mason-lspconfig.nvim" })
            use({ "neovim/nvim-lspconfig" })

            -- 补全源
            use("hrsh7th/nvim-cmp")
            use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
            use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
            use("hrsh7th/cmp-path") -- { name = 'path' }
            use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

              -- vsnip
            use("hrsh7th/vim-vsnip")
            use("hrsh7th/cmp-vsnip")

            -- UI 增强
            use("onsails/lspkind-nvim")





            if paccker_bootstrap then
                packer.sync()
            end
        end,
        config = {
            -- 最大并发数
            max_jobs = 16,
            -- 自定义源
            git = {
                -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s"
            }
            -- display = {
            -- 使用浮动窗口显示
            --   open_fn = function()
            --     return require("packer.util").float({ border = "single" })
            --   end,
            -- },
        }
    }
)