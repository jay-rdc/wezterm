local wezterm = require("wezterm")
local keys = require("keys")
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

  leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 500 },
  keys = keys,
  key_tables = {
    search_mode = {
      { key = "r",      mods = "CTRL", action = wezterm.action.CopyMode("CycleMatchType") },
      { key = "k",      mods = "CTRL", action = wezterm.action.CopyMode("PriorMatch") },
      { key = "j",      mods = "CTRL", action = wezterm.action.CopyMode("NextMatch") },
      { key = "u",      mods = "CTRL", action = wezterm.action.CopyMode("ClearPattern") },
      { key = "c",      mods = "CTRL", action = wezterm.action.CopyMode("Close") },
      { key = "Escape", mods = "NONE", action = wezterm.action.CopyMode("Close") },
    },
  },

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
