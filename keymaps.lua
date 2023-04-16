local wezterm = require("wezterm")
local action = wezterm.action

return {
  leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 500 },

  keys = {
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
    { key = "z",      mods = "LEADER | CTRL",  action = action.TogglePaneZoomState },

    { key = "c",      mods = "LEADER | CTRL",  action = action.ActivateCopyMode },
    { key = "f",      mods = "LEADER | CTRL",  action = action.Search("CurrentSelectionOrEmptyString") },
  },

  key_tables = {
    search_mode = {
      { key = "r",      mods = "CTRL", action = action.CopyMode("CycleMatchType") },
      { key = "k",      mods = "CTRL", action = action.CopyMode("PriorMatch") },
      { key = "j",      mods = "CTRL", action = action.CopyMode("NextMatch") },
      { key = "u",      mods = "CTRL", action = action.CopyMode("ClearPattern") },
      { key = "c",      mods = "CTRL", action = action.CopyMode("Close") },
      { key = "Escape",                action = action.CopyMode("Close") },
    },
  },
}
