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