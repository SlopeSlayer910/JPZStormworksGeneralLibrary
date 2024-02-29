--#region clamp
function clamp(min, max, value)
    return math.max(min, math.min(max, value))
  end
--#endregion

--Converts turns to degrees
---@param turns number The turns for conversion (North 0, Clockwise, turns)
---@return number bearing The degrees output
function turnsToDegrees(turns)
    return turns*360
end


--Converts turns to degrees and normalises it between 0 - 360
---@param turns number The turns for conversion (North 0, Clockwise, turns)
---@return number bearing The degrees output (0->360)
function turnsToBearing(turns)
    local bearing = ((1+turns)%1)*360
    return bearing
end


--Converts cartesian coordinates to polar coordinates
---@param x number The x for conversion 
---@param y number The y for conversion
---@return number angle, number distance The angle (North 0, Clockwise, radians) and distance value of the coverted coordinate
function cartesianToPolar(x,y)
    local angle, distance = math.atan(x,-y), math.sqrt(x^2+y^2)
    return angle, distance
end

--Converts polar coordinates to cartesian coordinates
---@param angle number The angle for conversion (North 0, Clockwise, radians)
---@param distance number The distance for conversion
---@return number x, number y The x and y value of the coverted coordinate
function polarToCartesian(angle,distance)
    local x, y = distance*math.sin(angle), -distance*math.cos(angle)
    return x, y
end

--Converts an int into a table of 1's and 0's
---@param int number The integer to convert (will be floored)
---@return table bits The table of 1's and 0's
function intToBits(int)
    local bits = {}  -- Table to store the bits
    while math.floor(int) > 0 do
        local rest = math.floor(int % 2)
        bits[#bits + 1] = rest
        int = (int - rest) / 2
    end
    return bits
end

--Converts an int into a table of 1's and 0's
---@param bitTable table The table of bits to convert
---@return table boolTable The table of of true and false
function bitTableToBoolTable(bitTable)
    local boolTable = {}
    for k, v in pairs(bitTable) do
        if v then
            if v == 0 then
                boolTable[k] = false
            else
                boolTable[k] = true
            end
        else
            boolTable[k] = false
        end
    end
    for i = 1, #boolTable, 1 do
        if (boolTable[i] ~= true and boolTable[i] ~= false) then
            boolTable[i] = false
        end
    end
    return boolTable
end