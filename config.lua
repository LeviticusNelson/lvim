--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
vim.g.vscode_style = "dark"
lvim.colorscheme = "onedarker"
vim.o.guifont = "JetBrainsMono Nerd Font Mono"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
vim.opt.titlestring = "👾"
vim.o.cmdheight = 1
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
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<C-h>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>"
lvim.keys.normal_mode["<C-j>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>"
lvim.keys.normal_mode["<C-k>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>"
lvim.keys.normal_mode["<C-l>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>"
lvim.keys.normal_mode["<C-\\>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>"
lvim.keys.normal_mode["<C-Space>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>"

lvim.keys.normal_mode["<C-p>"] = ":lua require'plenary.busted'<cr> :echo 'hello'<cr> <Plug>PlenaryTestFile <cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

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
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
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
-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	-- { command = "black", filetypes = { "python" } },
	-- { command = "isort", filetypes = { "python" } },
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
		command = "phpcsfixer",
		filetypes = { "php" },
		extra_args = { "--no-interaction", "--quiet", "fix", "$FILENAME" },
	},
	{
		command = "shellharden",
	},
	{
		command = "stylua",
		filetypes = { "lua" },
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
	{ "folke/tokyonight.nvim" },
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
		"Mofiqul/vscode.nvim",
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
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = {
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					"<C-y>",
					"<C-e>",
					"zt",
					"zz",
					"zb",
				},
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end,
	},
	{ "alexghergh/nvim-tmux-navigation" },
	{ "leviticusnelson/sfdx.nvim" },
	{
		"mrjones2014/dash.nvim",
		run = "make install",
	},
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

lvim.builtin.treesitter.rainbow.enable = true

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.lua",
	command = "setlocal ts=8 sw=8",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = { "*.cls", "*.trigger" },
	command = "set filetype=apexcode",
})
