local wezterm = require("wezterm")

local format_title = function(title, is_active, max_width)
	local background = { Background = { Color = "#1f1f28" } }
	local title_len = #title
	local pad_len = math.floor((max_width - title_len) / 2)

	local formatted_title = {
		Text = string.rep(" ", pad_len) .. title .. string.rep(" ", pad_len),
	}
	if is_active then
		return { background, { Foreground = { Color = "#957fb8" } }, formatted_title }
	else
		return { background, { Foreground = { Color = "#cad3f5" } }, formatted_title }
	end
end

local user_var_tab_title_key = "tab_title"
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- if there is title already set, proceed with it
	if type(tab.tab_title) == "string" and #tab.tab_title > 0 then
		return format_title(tab.tab_title, tab.is_active, max_width)
	end
	return format_title("temp", tab.is_active, max_width)
end)

wezterm.on("update-right-status", function(window)
	local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
	window:set_right_status({ Foreground = { Color = "#cad3f5" } }, wezterm.format({ { Text = " " .. date .. " " } }))
end)

wezterm.on("user-var-changed", function(window, pane, name, value)
	wezterm.log_info("user-var-changed", name, value)
	if name == user_var_tab_title_key then
		pane:tab():set_title(value)
	end
end)

-- Available themes: https://wezfurlong.org/wezterm/colorschemes/a/index.html
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]

-- custom.tab_bar.inactive_tab = {
-- 	bg_color = '#5b5072',
-- 	fg_color = '#808080',
-- }

return {
	font = wezterm.font("FiraCode Nerd Font Mono"),
	font_size = 14,
	-- dpi = 144.0,
	tab_max_width = 14,

	window_decorations = "RESIZE", -- Hide title bar
	window_background_opacity = 0.98,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,

	visual_bell = {
		fade_in_duration_ms = 100
	},

	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.3,
	},

	-- Note: To enable sync with OS theme, checkout https://github.com/catppuccin/wezterm#usage
	color_schemes = {
		["custom"] = custom,
	},
	color_scheme = "custom",
}
