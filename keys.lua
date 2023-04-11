local wezterm = require("wezterm")
local action = wezterm.action

return {
  { key = "F12",    action = action.EmitEvent("toggle-opacity") },

  { key = "W",      mods = "CTRL | SHIFT",  action = action.CloseCurrentTab({ confirm = false }) },
  { key = "Delete", mods = "CTRL | SHIFT",  action = action.QuitApplication },
  { key = "{",      mods = "CTRL | SHIFT",  action = action.MoveTabRelative(-1) },
  { key = "}",      mods = "CTRL | SHIFT",  action = action.MoveTabRelative(1) },

  { key = "c",      mods = "LEADER | CTRL",  action = action.ActivateCopyMode },

  { key = "|",      mods = "LEADER | SHIFT", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "_",      mods = "LEADER | SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "h",      mods = "LEADER | CTRL",  action = action.ActivatePaneDirection("Left") },
  { key = "l",      mods = "LEADER | CTRL",  action = action.ActivatePaneDirection("Right") },
  { key = "j",      mods = "LEADER | CTRL",  action = action.ActivatePaneDirection("Down") },
  { key = "k",      mods = "LEADER | CTRL",  action = action.ActivatePaneDirection("Up") },
  { key = "p",      mods = "LEADER",         action = action.PaneSelect },
}
