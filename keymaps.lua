local wezterm = require("wezterm")
local action = wezterm.action

return {
  leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 500 },

  keys = {
    { key = "F12",                             action = action.EmitEvent("toggle-opacity") },

    { key = "Delete", mods = "CTRL | SHIFT",   action = action.QuitApplication },
    { key = "p",      mods = "CTRL | SHIFT",   action = action.ActivateCommandPalette },
    { key = "c",      mods = "CTRL | SHIFT",   action = action.CopyTo("Clipboard") },
    { key = "v",      mods = "CTRL | SHIFT",   action = action.PasteFrom("Clipboard") },

    { key = "{",      mods = "CTRL | SHIFT",   action = action.MoveTabRelative(-1) },
    { key = "}",      mods = "CTRL | SHIFT",   action = action.MoveTabRelative(1) },
    { key = ",",      mods = "LEADER | CTRL",  action = action.ActivateTabRelative(-1) },
    { key = ".",      mods = "LEADER | CTRL",  action = action.ActivateTabRelative(1) },
    { key = "t",      mods = "LEADER | CTRL",  action = action.SpawnTab("CurrentPaneDomain") },
    { key = "w",      mods = "LEADER | CTRL",  action = action.CloseCurrentTab({ confirm = false }) },
    { key = "1",      mods = "LEADER | CTRL",  action = action.ActivateTab(0) },
    { key = "2",      mods = "LEADER | CTRL",  action = action.ActivateTab(1) },
    { key = "3",      mods = "LEADER | CTRL",  action = action.ActivateTab(2) },
    { key = "4",      mods = "LEADER | CTRL",  action = action.ActivateTab(3) },
    { key = "5",      mods = "LEADER | CTRL",  action = action.ActivateTab(4) },
    { key = "6",      mods = "LEADER | CTRL",  action = action.ActivateTab(5) },
    { key = "7",      mods = "LEADER | CTRL",  action = action.ActivateTab(6) },
    { key = "8",      mods = "LEADER | CTRL",  action = action.ActivateTab(7) },
    { key = "9",      mods = "LEADER | CTRL",  action = action.ActivateTab(8) },

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
