local wezterm = require 'wezterm'

local walpaper = io.open('/home/johannes/.cache/wal/wal'):read "*a"
-- local colors = wezterm.color.extract_colors_from_image '/home/johannes/Pictures/medusas_head.jpg'
local colors = wezterm.color.extract_colors_from_image(walpaper)
local ansi = {}
local brights = {}

for idx, color in ipairs(colors) do
  if idx <= 8 then
    ansi[idx] = color
  else
    brights[idx - 8] = color
  end
end

return {
  disable_default_key_bindings = true,
  font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font",
    "Fira Code",
  }),
  -- color_scheme = "Srcery (Gogh)",
  color_scheme_dirs = {'/home/johannes/.cache/wal'},
  colors = {
    ansi= ansi,
    brights = brights,
  },
  -- color_scheme='colors-wal',
  -- colors, metadata = wezterm.color.load_base16_scheme('/home/johannes/.cache/wal/colors'),
  -- colors, metadata = wezterm.color.load_scheme('/home/johannes/.cache/wal/colors.sh'),
  -- color_scheme='Batman',
  window_background_opacity = 0.8,
  enable_tab_bar = false,
  scrollback_lines = 3500,
  window_decorations = "RESIZE",
  font_size = 15,
  -- leader = { key = 'Alt', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    -- { key = 'v', mods = 'ALT', action = wezterm.action.PasteFrom },
    -- { key = 'c', mods = 'ALT', action = wezterm.action.Copy },
    { key = "v", mods = "ALT", action = wezterm.action.ActivateCopyMode },
    { key = 'x', mods = 'ALT', action = wezterm.action.ActivateCopyMode },
    { key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
    { key = "h", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-left") },
		{ key = "j", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-down") },
		{ key = "k", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-up") },
		{ key = "l", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-right") },
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
    { key = "v", mods = "ALT", action = wezterm.action({PasteFrom = "Clipboard"})},
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "1", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
    {
      key = 'u',
      mods = 'ALT',
      action = wezterm.action.ReloadConfiguration,
    },
  }
}
