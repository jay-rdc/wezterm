local wezterm = require("wezterm")
local keymaps = require("keymaps")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local default_opacity = 0.75
wezterm.on("toggle-opacity", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if overrides.window_background_opacity ~= 1 then
    overrides.window_background_opacity = 1
  else
    overrides.window_background_opacity = default_opacity
  end
  window:set_config_overrides(overrides)
end)

return {
  default_prog = { "wsl.exe", "--cd", "~" },
  font = wezterm.font("JetBrainsMono NF", { weight = "Medium" }),
  harfbuzz_features = { "zero" },
  font_size = 14.0,
  color_scheme = "Tango (terminal.sexy)",
  window_background_opacity = default_opacity,
  enable_tab_bar = false,
  audible_bell = "Disabled",
  cursor_blink_rate = 0,

  leader = keymaps.leader,
  keys = keymaps.keys,
  key_tables = keymaps.key_tables,

  colors = {
    cursor_fg = "black",
    cursor_bg = "white",
    cursor_border = "white",
  },

  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
}
