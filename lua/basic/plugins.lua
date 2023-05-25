---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim
local packer = require("packer")
packer.startup({
    -- 所有插件的安装都书写在 function 中
    function()
        -- 包管理器
        use {"wbthomason/packer.nvim"}

        -- 中文文档
        use {"yianwillis/vimcdoc"}

        -- nvim-tree
        use {
            "kyazdani42/nvim-tree.lua",
            requires = { -- 依赖一个图标插件
                "kyazdani42/nvim-web-devicons"
	    },
            config = function()
                -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
                require("conf.nvim-tree")
            end
        }

        -- 主题
        -- use {
        --     "rebelot/kanagawa.nvim",
        --     config = function()
        --         require("conf.kanagawa")
        --     end
        -- }

        use {
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("conf.catppuccin")
            end
        }

        use {
            'nvim-tree/nvim-web-devicons',
            config = function()
                require("conf.nvim-web-devicons")
            end
        }

        -- 模糊查找
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
	        "nvim-lua/plenary.nvim", -- Lua 开发模块
                "BurntSushi/ripgrep", -- 文字查找
                "sharkdp/fd" -- 文件查找
            },
            config = function()
                require("conf.telescope")
            end
        }

    	-- 内置终端
    	use {
    	    "akinsho/toggleterm.nvim",
    	    config=function()
    	        require("conf.toggleterm")
    	    end
    	}

    	-- 支持 LSP 状态的 buffer 栏
        use {
            "akinsho/bufferline.nvim",
            requires = {"famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
            },
            config = function()
                require("conf.bufferline")
            end
        }

        use {
            "williamboman/mason.nvim",
            run = ":MasonUpdate", -- :MasonUpdate updates registry contents
            config = function()
                require("conf.mason")
            end
        }

        use {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("conf.mason-lspconfig")
            end
        }

        -- LSP 基础服务
        use {
            "neovim/nvim-lspconfig",
            config = function()
                require("conf.nvim-lspconfig")
            end
        }

        -- 插入模式获得函数签名
        use {
            "ray-x/lsp_signature.nvim",
            config = function()
                require("conf.lsp_signature")
            end
        }

        -- 自动代码补全系列插件
        use {
            "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
            requires = {
                {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
                {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
                -- {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
                {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                {"hrsh7th/cmp-path"}, -- 路径补全
                {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                {"hrsh7th/cmp-cmdline"}, -- 命令补全
                {"f3fora/cmp-spell"}, -- 拼写建议
                -- {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
                {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
                {
                    "tzachar/cmp-tabnine",
                    run = "./install.sh"
                } -- tabnine 源,提供基于 AI 的智能补全
            },
            config = function()
                require("conf.nvim-cmp")
            end
        }

        -- 自动保存
        use {
            "Pocco81/auto-save.nvim",
            config = function()
                require("conf.auto-save")
            end
        }

        -- 搜索时显示条目
        use {
            "kevinhwang91/nvim-hlslens",
            config = function()
                require("conf.nvim-hlslens")
            end
        }

        -- 自动匹配括号
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("conf.nvim-autopairs")
            end
        }

        -- 自动恢复光标位置
        use {
            "ethanholz/nvim-lastplace",
            config = function()
                require("conf.nvim-lastplace")
            end
        }

        -- 灯泡提示代码行为
        use {
            "kosayoda/nvim-lightbulb",
            config = function()
                require("conf.nvim-lightbulb")
            end
        }

        -- 代码注释
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("conf.Comment")
            end
        }

        -- 自动会话管理
        use {
            "rmagatti/auto-session",
            config = function()
                require("conf.auto-session")
            end
        }

        -- view tree
        use {
            "liuchengxu/vista.vim",
            config = function()
                require("conf.vista")
            end
        }

        use {
            "sindrets/diffview.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            config = function ()
                require("conf.diffview")
            end
        }
    end,

    -- 使用浮动窗口
    config = {
        display = {
            open_fn = require("packer.util").float
        }
    }
})

-- 实时生效配置
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
