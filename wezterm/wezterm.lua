-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local launch_menu = {}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'rose-pine'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.window_background_opacity = 0.9

-- powershell as default program
config.default_prog = { 'powershell.exe', '-NoLogo' }

-- check if the environment is win32 or win64
if os.getenv('win32') or os.getenv('win64') then
    -- if it is, add the 64-bit version of powershell to the launch menu
    table.insert(launch_menu, {
        label = 'PowerShell',
        args = { 'powershell.exe', '-NoLogo' },
    })
end

-- and finally, return the configuration to wezterm
config.launch_menu = launch_menu
config.window_padding = {
    left = 8,
    right = 8,
    top = 0,
    bottom = 0,
}

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 24

config.colors = {
    tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        background = '#191724',

        -- The active tab is the one that has focus in the window
        active_tab = {
            -- The color of the background area for the tab
            bg_color = '#26233a',
            -- The color of the text for the tab
            fg_color = '#e0def4',

            -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
            -- label shown for this tab.
            -- The default is "Normal"
            intensity = 'Normal',

            -- Specify whether you want "None", "Single" or "Double" underline for
            -- label shown for this tab.
            -- The default is "None"
            underline = 'None',

            -- Specify whether you want the text to be italic (true) or not (false)
            -- for this tab.  The default is false.
            italic = false,

            -- Specify whether you want the text to be rendered with strikethrough (true)
            -- or not for this tab.  The default is false.
            strikethrough = false,
        },

        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
            bg_color = '#191724',
            fg_color = '#808080',

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#909090',
            italic = true,

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab_hover`.
        },

        -- The new tab button that let you create new tabs
        new_tab = {
            bg_color = '#1b1032',
            fg_color = '#808080',

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over the new tab button
        new_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#909090',
            italic = true,

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab_hover`.
        },
    },
}

return config
