-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 
-- x -
---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "monochrome",

	hl_override = {
		Comment = { italic = true , bold=true},
		["@comment"] = { italic = true},
    Error = {italic = true},
    ErrorMsg = {italic=true},
    Warning = {italic = true},
    WarningMsg = {italic=true},
    DiagnosticError = {italic=true, bg="lightbg"},
    DiagnosticWarn = {italic=true, bg="lightbg"},
    DiagnosticHint = {italic=true, bg="lightbg"},
    DiagnosticInfo = {italic=true, bg="lightbg"},

	},
}

return M
