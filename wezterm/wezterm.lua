local wezterm = require 'wezterm'
local act = wezterm.action

return {
keys = {
    { key = 'k', mods = 'SHIFT', action = act.ScrollByPage(-1) },
    { key = 'j', mods = 'SHIFT', action = act.ScrollByPage(1) },
  },
  font_size=10,
  -- enable_scroll_bar=true,
  hide_tab_bar_if_only_one_tab = true,
  window_frame = {
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },

    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems
    font_size = 12.0,

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#333333',

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#333333',
  },

  colors = {
    tab_bar = {
      -- The color of the inactive tab bar edge/divider
      inactive_tab_edge = '#575757',
    },
  },

  window_padding = {
    top = 0,
    right = 3,
    bottom = 0,
    left = 3,
  },
}
