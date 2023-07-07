local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	-- allow `wezterm start -- something` to affect what we spawn
	-- in our initial window
	local args = {}
	if cmd then
		args = cmd.args
	end

	local home = wezterm.home_dir

	local tab_monitoring, window = mux.spawn_window({
		workspace = "default",
		cwd = home .. "/dotfiles",
	})

	local tab_project1 = window:spawn_tab({ cwd = home .. "/Code/Project1" })
	tab_project1:set_title("Project1")

	window:gui_window():maximize()
	tab_monitoring:send_text("btop\n")
	tab_monitoring:set_title("Monitoring")

	local dotfiles_tab = window:spawn_tab({
		args = args,
		cwd = home .. "/.dotfiles",
	})
	dotfiles_tab:set_title("dotfiles")

	window:gui_window():perform_action(act.ActivateTab(0), tab_project1)
end)

return {}
