local wezterm = require "wezterm"
local mux = wezterm.mux

wezterm.on("gui-startup", function ()
  local _, _, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

wezterm.on("toggle-opacity", function (window, _)
  local overrides = window:get_config_overrides() or {}
  if overrides.window_background_opacity ~= 1 then
    overrides.window_background_opacity = 1
  else
    overrides.window_background_opacity = 0.75
  end
  window:set_config_overrides(overrides)
end)

return {
  default_prog = { "C:/Program Files/PowerShell/7/pwsh.exe" },
  font = wezterm.font("CaskaydiaCove NF"),
  font_size = 14.0,
  color_scheme = "Tango (terminal.sexy)",
  window_background_opacity = 0.75,

  colors = {
    cursor_fg = "black",
    cursor_bg = "white",
    cursor_border = "white",
  },

  keys = {
    {
      key = "F12",
      action = wezterm.action.EmitEvent "toggle-opacity",
    },
    {
      key = "w",
      mods = "CTRL",
      action = wezterm.action.CloseCurrentTab { confirm = false },
    },
  },
}
