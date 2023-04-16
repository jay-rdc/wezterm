local wezterm = require("wezterm")
local action = wezterm.action

return {
  { key = "F12",                             action = action.EmitEvent("toggle-opacity") },

  { key = "w",      mods = "CTRL | SHIFT",   action = action.CloseCurrentTab({ confirm = false }) },
  { key = "{",      mods = "CTRL | SHIFT",   action = action.MoveTabRelative(-1) },
  { key = "}",      mods = "CTRL | SHIFT",   action = action.MoveTabRelative(1) },
  { key = "Delete", mods = "CTRL | SHIFT",   action = action.QuitApplication },

  { key = "|",      mods = "LEADER | SHIFT", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "_",      mods = "LEADER | SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "h",      mods = "LEADER | CTRL",  action = action.ActivatePaneDirection("Left") },
  { key = "l",      mods = "LEADER | CTRL",  action = action.ActivatePaneDirection("Right") },
  { key = "j",      mods = "LEADER | CTRL",  action = action.ActivatePaneDirection("Down") },
  { key = "k",      mods = "LEADER | CTRL",  action = action.ActivatePaneDirection("Up") },
  { key = "p",      mods = "LEADER | CTRL",  action = action.PaneSelect },

  { key = "c",      mods = "LEADER | CTRL",  action = action.ActivateCopyMode },
  { key = "f",      mods = "LEADER | CTRL",  action = action.Search("CurrentSelectionOrEmptyString") },
  { key = "z",      mods = "LEADER | CTRL",  action = action.TogglePaneZoomState },
}
