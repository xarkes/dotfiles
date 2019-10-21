------------------------------
--   xarkes awesome theme   --
------------------------------

local themes_path = require("gears.filesystem").get_configuration_dir()
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "xarkes/wallpaper4.jpg"
theme.icon_theme = "Papirus-Dark"
-- }}}

-- {{{ Styles
theme.font      = "Lekton Nerd Font Mono Bold 11"

-- {{{ Colors
theme.orange     = "#F1AB86"
theme.red        = "#EF626C"
theme.blue       = "#BDF9F5"
theme.green      = "#20af92"
theme.blue       = "#2d8dc4"
theme.darkblue   = "#2e7195"
theme.invis      = "#00000000"
theme.black      = "#000000"
theme.white      = "#ffffff"

theme.fg_normal  = theme.white
theme.fg_focus   = theme.white
theme.fg_urgent  = theme.red
theme.bg_normal  = theme.black
theme.bg_focus   = theme.black
theme.bg_urgent  = theme.black
theme.bg_systray = theme.black
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(0)
theme.border_width  = dpi(2)
theme.border_normal = "#3F3F3F"
theme.border_focus  = theme.darkblue
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars are disabled for this theme
--theme.titlebar_bg_focus  = "#3F3F3F"
--theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the xarkes one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_fg_focus      = theme.blue
theme.taglist_bg_focus      = theme.invis
theme.taglist_fg_occupied   = theme.darkblue
theme.taglist_font          = "Lekton Nerd Font Mono 25"

theme.tasklist_fg_focus     = theme.blue
theme.tasklist_disable_icon = true
-- }}} -- Styles

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
-- theme.taglist_squares_sel   = themes_path .. "xarkes/taglist/squarefz.png"
-- theme.taglist_squares_unsel = themes_path .. "xarkes/taglist/squarez.png"
-- theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "xarkes/awesome-icon.png"
theme.menu_submenu_icon      = themes_path .. "xarkes/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "xarkes/layouts/tile.png"
theme.layout_tileleft   = themes_path .. "xarkes/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "xarkes/layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "xarkes/layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "xarkes/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "xarkes/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "xarkes/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "xarkes/layouts/dwindle.png"
theme.layout_max        = themes_path .. "xarkes/layouts/max.png"
theme.layout_fullscreen = themes_path .. "xarkes/layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "xarkes/layouts/magnifier.png"
theme.layout_floating   = themes_path .. "xarkes/layouts/floating.png"
theme.layout_cornernw   = themes_path .. "xarkes/layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "xarkes/layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "xarkes/layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "xarkes/layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "xarkes/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "xarkes/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "xarkes/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "xarkes/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "xarkes/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "xarkes/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "xarkes/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "xarkes/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "xarkes/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "xarkes/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "xarkes/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "xarkes/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "xarkes/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "xarkes/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "xarkes/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "xarkes/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "xarkes/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "xarkes/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "xarkes/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "xarkes/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
