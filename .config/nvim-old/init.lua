require("config.vim")

require("config.lazy")
vim.cmd.colorscheme("catppuccin")

local force_black = {
	"Normal",
	"NormalNC",
	"SignColumn",
	"LineNr",
	"CursorLine",
	"CursorLineNr",
	"FoldColumn",
	"StatusLine",
	"StatusLineNC",
	"TabLine",
	"TabLineFill",
	"WinSeparator",
	"EndOfBuffer",
	"NormalFloat",
	"FloatBorder",
	"Pmenu",
	"PmenuSel",
	"TelescopeNormal",
	"TelescopeBorder",
	"TelescopePromptNormal",
	"TelescopePromptBorder",
	"TelescopeResultsNormal",
	"TelescopeResultsBorder",
	"TelescopePreviewNormal",
	"TelescopePreviewBorder",
}

for _, g in ipairs(force_black) do
	vim.api.nvim_set_hl(0, g, { bg = "#000000" })
end
