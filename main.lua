-- not the actuall app
-- just to let you see the code through here ^.^

require "asi"
require "color"

platform.window:setBackgroundColor(color.white)
cursor.set("pencil")

local colors = {
    -- numbers
    ["0"] = {255, 255, 255},  -- white
    ["1"] = {0, 0, 0},        -- black
    ["2"] = {255, 0, 0},      -- red
    ["3"] = {0, 255, 0},      -- green
    ["4"] = {0, 0, 255},      -- blue
    ["5"] = {255, 255, 0},    -- yellow
    ["6"] = {0, 255, 255},    -- cyan
    ["7"] = {255, 0, 255},    -- magenta
    ["8"] = {255, 165, 0},    -- orange
    ["9"] = {255, 192, 203},  -- pink

    -- letters
    a = {128, 0, 128},        -- purple
    b = {165, 42, 42},        -- brown
    c = {128, 128, 128},      -- grey
    d = {0, 255, 0},          -- lime
    e = {173, 216, 230},      -- light_blue
    f = {0, 128, 128},        -- teal
    g = {0, 0, 128},          -- navy
    h = {128, 0, 0},          -- maroon
    i = {128, 128, 0},        -- olive
    j = {255, 215, 0},        -- gold
    k = {255, 127, 80},       -- coral
    l = {250, 128, 114},      -- salmon
    m = {75, 0, 130},         -- indigo
    n = {238, 130, 238},      -- violet
    o = {64, 224, 208},       -- turquoise
    p = {220, 20, 60},        -- crimson
    q = {255, 218, 185},      -- peach
    r = {230, 230, 250},      -- lavender
    s = {189, 252, 201},      -- mint
    t = {245, 245, 220},      -- beige
    u = {240, 230, 140},      -- khaki
    v = {192, 192, 192},      -- silver
    w = {210, 105, 30},       -- chocolate
    x = {0, 191, 255},        -- deep_sky
    y = {34, 139, 34},        -- forest
    z = {64, 64, 64}          -- dark_gray
}

-- readme image in tns file!
-- this is just a placeholder
local img_string = "abcdefghijklmnopqrstuvwxyz1234567890"

local arg_x, arg_y = 1, 1
local pixel_size = 3
local image_size = 70

function on.paint(gc)
    local x, y = 0, 0
    local count = 0
    
    for i = 1, #img_string do
        local char = img_string:sub(i,i)
        local color = colors[char]
        
        if color then
            gc:setColorRGB(color[1], color[2], color[3])
        else
            gc:setColorRGB(0, 0, 0)
        end
        
        gc:fillRect(x+arg_x, y+arg_y, pixel_size, pixel_size)
        
        count = count + 1
        x = x + pixel_size
        
        if count >= image_size then
            count = 0
            x = 0
            y = y + pixel_size
        end
    end
    gc:setColorRGB(0, 0, 0)
    gc:drawRect(arg_x,arg_y,image_size*pixel_size,image_size*pixel_size-1)
    gc:drawString("Sizes:", 215, 0)
    gc:drawString("← "..#img_string.." chars", 215, 50)
    gc:drawString("pixel: "..pixel_size.." px", 215, 15)
    gc:drawString("image: "..image_size.." px", 215, 30)
end
