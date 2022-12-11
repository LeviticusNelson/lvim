-- general
lvim.log.level = "warn"
lvim.format_on_save = true
vim.o.guifont = "JetBrainsMono Nerd Font Mono"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
vim.opt.titlestring = "👾"
vim.o.cmdheight = 0
vim.wo.number = true
vim.wo.relativenumber = true
lvim.transparent_window = true

lvim.builtin.alpha.dashboard.section.header.val = {

    [[ __       ______   __   __ __   ______  __   ______   __  __   ______     ]],
    [[/\ \     /\  ___\ /\ \ / //\ \ /\__  _\/\ \ /\  ___\ /\ \/\ \ /\  ___\    ]],
    [[\ \ \____\ \  __\ \ \ \'/ \ \ \\/_/\ \/\ \ \\ \ \____\ \ \_\ \\ \___  \   ]],
    [[ \ \_____\\ \_____\\ \__|  \ \_\  \ \_\ \ \_\\ \_____\\ \_____\\/\_____\  ]],
    [[  \/_____/ \/_____/ \/_/    \/_/   \/_/  \/_/ \/_____/ \/_____/ \/_____/  ]],
    [[                                                                          ]],
    [[          __   __   ______   __       ______   ______   __   __           ]],
    [[         /\ "-.\ \ /\  ___\ /\ \     /\  ___\ /\  __ \ /\ "-.\ \          ]],
    [[         \ \ \-.  \\ \  __\ \ \ \____\ \___  \\ \ \/\ \\ \ \-.  \         ]],
    [[          \ \_\\"\_\\ \_____\\ \_____\\/\_____\\ \_____\\ \_\\"\_\        ]],
    [[           \/_/ \/_/ \/_____/ \/_____/ \/_____/ \/_____/ \/_/ \/_/        ]],
}
lvim.builtin.alpha.dashboard.section.footer.val = "leviticusnelson.com"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
-- lvim.builtin.nvimtree.setup.view.side = "left"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.playground.persist_queries = true

-- -- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        -- extra_args = { "--tab-width=4" },
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "jsonc",
            "yaml",
            "markdown",
            "graphql",
            "handlebars",
            "solidity",
            "apexcode",
        },
    },
    {
        command = "shellharden",
    },
    {
        command = "stylua",
        filetypes = { "lua" },
        extra_args = { "--indent-width=4", "--indent-type=spaces" },
    },
    {
        command = "swiftformat",
        filetypes = { "swift" },
    },
})

-- -- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
    { command = "flake8", filetypes = { "python" } },
    {
        -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "shellcheck",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--severity", "warning" },
    },
    {
        command = "codespell",
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "javascript", "python" },
    },
    {
        command = "solhint",
    },
})

-- Additional Plugins
lvim.plugins = {
    {
        "nvim-treesitter/playground",
    },
    {
        "monsonjeremy/onedark.nvim",
        branch = "treesitter",
        config = function()
            require("onedark").setup({
                customTelescope = true,
            })
        end,
    },
    { "leviticusnelson/pg_go" },
    {
        "xbase-lab/xbase",
        run = "make install", -- make free_space (not recommended, longer build time)
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("xbase").setup({}) -- see default configuration bellow
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    {
        "p00f/nvim-ts-rainbow",
    },
    {
        "folke/lsp-colors.nvim",
        event = "BufRead",
    },
    {
        "rktjmp/lush.nvim",
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" }, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd("highlight default link gitblame SpecialComment")
            vim.g.gitblame_enabled = 0
        end,
    },
    {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
    },
    { "leviticusnelson/sfdx.nvim" },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("rust-tools").setup({})
        end,
    },
}
lvim.colorscheme = "onedark"

lvim.builtin.treesitter.rainbow.enable = true

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.lua",
    command = "setlocal ts=4 sw=4",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.cls", "*.trigger" },
    command = "set filetype=apexcode",
})
