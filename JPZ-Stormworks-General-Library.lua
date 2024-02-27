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
--#region cartesianToPolar
function cartesianToPolar(X,Y)
    local angle, distance = math.atan(X,-Y), math.sqrt(X^2+Y^2)
    return angle, distance
end
--#endregion
--#region polarToCartesian
function polarToCartesian(angle,distance)
    local x, y = distance*math.sin(angle), -distance*math.cos(angle)
    return x, y
end
--#endregion