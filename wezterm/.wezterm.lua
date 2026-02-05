local wezterm = require("wezterm")
local config = {}

-- Detect OS
local is_windows = wezterm.target_triple:find("windows") ~= nil
local is_linux = wezterm.target_triple:find("linux") ~= nil

-- Default to WSL only on Windows
if is_windows then
	config.default_domain = "WSL:archlinux"
end

-- Font configuration
config.font = wezterm.font_with_fallback({
	{
		family = "IosevkaTerm Nerd Font Mono",
		weight = "Regular",
		harfbuzz_features = { "calt=1", "liga=1" }, -- Enable ligatures
	},
	"Consolas", -- Fallback
})
config.font_size = 14.0

-- Color scheme and rendering
config.color_scheme = "tokyonight"
config.bold_brightens_ansi_colors = true

-- Enable undercurl and vibrant colors
config.underline_thickness = 2
config.underline_position = -2

-- Performance and rendering
config.front_end = "WebGpu"
config.max_fps = 120

-- Cursor
config.default_cursor_style = "SteadyBar"  -- Outline bar, not block
config.cursor_thickness = 2

-- Tab bar - retro style, top position
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 80

-- No window frame/title bar - minimal UI
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_frame = {
	font = wezterm.font("IosevkaTerm Nerd Font Mono"),
	font_size = 10.0,
	border_left_width = 0,
	border_right_width = 0,
	border_bottom_height = 0,
	border_top_height = 0,
}
config.integrated_title_buttons = { 'Close' }

-- Window
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

-- Mouse and clipboard
config.mouse_bindings = {
	-- Copy on selection (tmux compatibility)
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
	},
	-- Paste on middle click
	{
		event = { Down = { streak = 1, button = "Middle" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("PrimarySelection"),
	},
}

-- Keyboard shortcuts
-- Leader key: Alt+Shift (for consistency with other tools, no conflicts)
config.leader = { key = "a", mods = "ALT|SHIFT", timeout_milliseconds = 1000 }

config.keys = {
	-- Ctrl+Shift+C to copy
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
	-- Ctrl+Shift+V to paste
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},

	-- PANE NAVIGATION (Alt+Shift+hjkl like nvim)
	{ key = "h", mods = "ALT|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "ALT|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "ALT|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "ALT|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },

	-- PANE CREATION (Alt+Shift+> right split, Alt+Shift+< vertical split)
	{
		key = ">",
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
	},
	{
		key = "<",
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
	},

	-- TAB MANAGEMENT (Alt+Shift+c/x)
	{ key = "c", mods = "ALT|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "x", mods = "ALT|SHIFT", action = wezterm.action.CloseCurrentTab { confirm = true } },

	-- CLOSE PANE (Alt+Shift+q) - unified close-pane key
	{ key = "q", mods = "ALT|SHIFT", action = wezterm.action.CloseCurrentPane { confirm = true } },

	-- TAB NAVIGATION (Alt+n/p)
	{ key = "n", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "p", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },

	-- PANE ZOOM (Alt+Shift+z)
	{ key = "z", mods = "ALT|SHIFT", action = wezterm.action.TogglePaneZoomState },

	-- RENAME TAB (Alt+Shift+,)
	{ key = ",", mods = "ALT|SHIFT", action = wezterm.action.PromptInputLine({
		description = "(wezterm) Set tab title:",
		action = wezterm.action_callback(function(window, pane, line)
			if line then
				window:active_tab():set_title(line)
			end
		end),
	}),
	},

	-- QUICK SELECT (built-in URLs, paths, hashes)
	{ key = "Space", mods = "CTRL|SHIFT", action = wezterm.action.QuickSelect },

	-- SEARCH SCROLLBACK
	{ key = "f", mods = "CTRL|SHIFT", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
}


-- Bell and notifications
config.audible_bell = "Disabled"

-- Status bar - shows workspace name on the right
wezterm.on("update-right-status", function(window, pane)
	local ws = window:active_workspace()
	-- Don't display the default workspace label; show only when named
	if ws and ws ~= "default" and ws ~= "" then
		window:set_right_status(ws .. " ")
	else
		window:set_right_status("")
	end
end)

-- Tab formatting - show current working directory
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- Minimal: prefer shell-set title, fallback to last component of CWD.file_path
	local shell_title = tab:get_title()
	if shell_title and shell_title ~= "" and shell_title ~= "wsl.exe" then
		return { { Text = shell_title } }
	end

	local pane = tab.active_pane
	local cwd = pane and pane.current_working_dir
	if cwd and cwd.file_path then
		local path = cwd.file_path:gsub("/$", "")
		local name = path:match("([^/\\]+)$") or path
		return { { Text = name } }
	end

	return { { Text = tostring(tab.tab_index + 1) } }
end)

return config
