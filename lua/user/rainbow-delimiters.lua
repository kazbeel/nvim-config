local status_ok, rainbow_delimiters = pcall(require, "rainbow-delimiters")
if not status_ok then
	return
end

require("rainbow-delimiters.setup")({
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
		javascript = "rainbow-delimiters-react",
		typescript = "rainbow-parens",
		tsx = "rainbow-parens",
	},
	highlight = {
		"RainbowDelimiterViolet",
		"RainbowDelimiterOrange",
		"RainbowDelimiterBlue",
		"RainbowDelimiterCyan",
		"RainbowDelimiterYellow",
		"RainbowDelimiterGreen",
		"RainbowDelimiterRed",
	},
	blacklist = { "c", "cpp" },
})
