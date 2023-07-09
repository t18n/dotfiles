local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

-- Docs: https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html?h=gui+startup
wezterm.on('gui-startup', function(cmd)
	-- allow `wezterm start -- something` to affect what we spawn
	-- in our initial window
	local args = {}
	if cmd then args = cmd.args end

	-- Active project
  local tab, pane, window = mux.spawn_window {
		workspace = 'active-project',
    cwd = wezterm.home_dir .. '/Code/active-project',
    args = args,
  }
	tab:set_title('Active Project')

	pane:send_text 'git status\n'

	local pane_build = pane:split {
		direction = 'Right',
		size = 0.3
	}
	pane_build:send_text 'yarn native\n'

  local pane_editor = pane_build:split {
    direction = 'Bottom',
    size = 0.5,
  }
	pane_editor:send_text 'yarn storybook\n'

	window:gui_window():maximize()
	
	-- Other reserved tabs
	local tab_dotfiles = window:spawn_tab({
		cwd = wezterm.home_dir .. '/dotfiles',
	})
	tab_dotfiles:set_title('Dotfiles')

	local tab_dotfiles = window:spawn_tab({
		cwd = wezterm.home_dir .. '/Code/Temp',
	})
	tab_dotfiles:set_title('Temp')
	
	window:gui_window():perform_action(act.ActivateTab(0), pane)
end)

return {}