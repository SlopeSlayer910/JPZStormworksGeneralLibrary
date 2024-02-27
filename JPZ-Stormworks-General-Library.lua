--#region clamp
function clamp(min, max, value)
    return math.max(min, math.min(max, value))
  end
--#endregion

--#region turnsToDegrees
function turnsToDegrees(turns)
    return turns*360
end
--#endregion

--#region turnsToBearing
function turnsToBearing(turns)
    return ((1+turns)%1)*360
end
--#endregion

--Converts cartesian coordinates to polar coordinates
---@param x number The angle for conversion (North 0, Clockwise, radians)
---@param y number The distance for conversion
---@return number angle, number distance The x and y value of the coverted coordinate
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