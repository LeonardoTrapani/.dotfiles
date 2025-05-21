-- Load core configuration modules
require("trapani.remap")  -- Key remappings
require("trapani.set")    -- Vim settings
require("trapani.lazy_init")  -- Plugin manager initialization

-- Create an augroup for Trapani-specific autocommands
local augroup = vim.api.nvim_create_augroup
local TrapaniGroup = augroup("Trapani", {})

-- Create an augroup for yank highlighting
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- Helper function to reload modules during development
function R(name)
	require("plenary.reload").reload_module(name)
end

-- Add custom filetype detection
vim.filetype.add({
	extension = {
		templ = "templ",  -- Support for templ files
	},
})

-- Highlight yanked text briefly
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,  -- Highlight duration in milliseconds
		})
	end,
})

-- LSP (Language Server Protocol) configuration
autocmd("LspAttach", {
	group = TrapaniGroup,
	callback = function(e)
		local opts = { buffer = e.buf }

		-- LSP key mappings
		vim.keymap.set("n", "<leader>gd", function()  -- Go to definition
			vim.lsp.buf.definition({ on_list = on_list })
		end, opts)
		vim.keymap.set("n", "K", function()  -- Show hover documentation
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()  -- Workspace symbols
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()  -- Show diagnostics
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<Tab>", function()  -- Next diagnostic
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "<S-Tab>", function()  -- Previous diagnostic
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>.", function()  -- Code actions
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)  -- Find references
		vim.keymap.set("n", "<leader>vrn", function()  -- Rename symbol
			vim.lsp.buf.rename()
		end, opts)
		-- Commented out signature help mapping
		-- vim.keymap.set("i", "", function()
		-- 	vim.lsp.buf.signature_help()
		-- end, opts)
	end,
})

-- Netrw (file explorer) settings
vim.g.netrw_browse_split = 0  -- Open files in the same window
vim.g.netrw_banner = 0        -- Hide the banner
vim.g.netrw_winsize = 25      -- Set window size
