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

local default_colors = {
  background = "black",
  cursor_fg = "black",
  cursor_bg = "white",
  cursor_border = "white",
}
wezterm.on("toggle-light-dark", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if overrides.colors.background == "black" then
    overrides.colors = {
      background = "white",
      cursor_fg = "white",
      cursor_bg = "black",
      cursor_border = "black",
    }
  else
    overrides.colors = default_colors
  end
  window:set_config_overrides(overrides)
end)

return {
  default_prog = { "wsl", "--cd", "~" },
  font = wezterm.font("JetBrainsMonoNL Nerd Font", { weight = "Medium" }),
  font_size = 14.0,
  color_scheme = "Tango (terminal.sexy)",
  window_background_opacity = default_opacity,
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  audible_bell = "Disabled",
  cursor_blink_rate = 0,

  disable_default_key_bindings = true,
  keys = keymaps.keys,

  colors = default_colors,

  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
}
