local wezterm = require("wezterm")
local action = wezterm.action
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
  default_prog = { "pwsh.exe", "-NoLogo" },
  font = wezterm.font("JetBrainsMono NF", { weight = "DemiBold" }),
  harfbuzz_features = { "zero" },
  font_size = 14.0,
  color_scheme = "Tango (terminal.sexy)",
  window_background_opacity = default_opacity,
  window_decorations = "RESIZE",

  colors = {
    cursor_fg = "black",
    cursor_bg = "white",
    cursor_border = "white",
  },

  keys = {
    {
      key = "F12",
      action = action.EmitEvent("toggle-opacity"),
    },
    {
      key = "w",
      mods = "CTRL | SHIFT",
      action = action.CloseCurrentTab({ confirm = false }),
    },
    {
      key = "{",
      mods = "CTRL | SHIFT",
      action = action.MoveTabRelative(-1),
    },
    {
      key = "}",
      mods = "CTRL | SHIFT",
      action = action.MoveTabRelative(1),
    },
  },
}
