local screen = require 'mjolnir.screen'
local window = require 'mjolnir.window'
local hotkey = require 'mjolnir.hotkey'
local grid = require 'mjolnir.bg.grid'

grid.MARGINY = 1
grid.MARGINX = 2
grid.GRIDWIDTH = 4

hotkey.bind({'cmd', 'alt', 'ctrl'}, 'space', function() mjolnir.reload() end)

hotkey.bind({'cmd', 'alt', 'ctrl'}, 'f', function()
    local win = window.focusedwindow()
    grid.set(win, {x=0, y=0, w=4, h=3}, win:screen())
end)

hotkey.bind({'cmd', 'alt', 'ctrl'}, 'right', function() 
    local win = window.focusedwindow()
    grid.set(win, {x=2, y=0, w=2, h=3}, win:screen())
end)

hotkey.bind({'cmd', 'alt', 'ctrl'}, 'left', function() 
    local win = window.focusedwindow()
    grid.set(win, {x=0, y=0, w=2, h=3}, win:screen())
end)

hotkey.bind({'cmd', 'alt', 'ctrl'}, 'p', function()
    local win = window.focusedwindow()
    grid.set(win, grid.get(win), win:screen():next())
end)
