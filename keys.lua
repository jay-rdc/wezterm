local wezterm = require("wezterm")
local action = wezterm.action

return {
  {
    key = "F12",
    action = action.EmitEvent("toggle-opacity"),
  },
  {
    key = "W",
    mods = "CTRL | SHIFT",
    action = action.CloseCurrentTab({ confirm = false }),
  },
  {
    key = "Delete",
    mods = "CTRL | SHIFT",
    action = action.QuitApplication,
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
  {
    key = "Space",
    mods = "LEADER | CTRL",
    action = action.ActivateCopyMode
  },
}
