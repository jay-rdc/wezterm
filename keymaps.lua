local wezterm = require("wezterm")
local action = wezterm.action

return {
  keys = {
    { key = "F12",                             action = action.EmitEvent("toggle-opacity") },

    { key = "-",      mods = "CTRL",           action = action.DecreaseFontSize },
    { key = "=",      mods = "CTRL",           action = action.IncreaseFontSize },
    { key = "0",      mods = "CTRL",           action = action.ResetFontSize },
    { key = "Delete", mods = "CTRL | SHIFT",   action = action.QuitApplication },
    { key = "p",      mods = "CTRL | SHIFT",   action = action.ActivateCommandPalette },
    { key = "c",      mods = "CTRL | SHIFT",   action = action.CopyTo("Clipboard") },
    { key = "v",      mods = "CTRL | SHIFT",   action = action.PasteFrom("Clipboard") },
    { key = "m",      mods = "CTRL | SHIFT",   action = action.Hide },
  },
}
