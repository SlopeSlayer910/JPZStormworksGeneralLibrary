--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey

---@diagnostic disable: undefined-doc-name


---@section clamp
--Converts turns to degrees
---@param min number The lower bound
---@param max number The upper bound
---@param value number The number to clamp bound
---@return number clampedValue The clamped output
function clamp(min, max, value)
    local clampedValue = math.max(min, math.min(max, value))
    return clampedValue
end
---@endsection

---@section turnsToDegrees
--Converts turns to degrees
---@param turns number The turns for conversion (North 0, Clockwise, turns)
---@return number bearing The degrees output
function turnsToDegrees(turns)
    return turns*360
end
---@endsection

---@section turnsToBearing
--Converts turns to degrees and normalises it between 0 - 360
---@param turns number The turns for conversion (North 0, Clockwise, turns)
---@return number bearing The degrees output (0->360)
function turnsToBearing(turns)
    local bearing = ((1+turns)%1)*360
    return bearing
end
---@endsection

---@section cartesianToPolar
--Converts cartesian coordinates to polar coordinates
---@param x number The x for conversion 
---@param y number The y for conversion
---@return number angle, number distance The angle (North 0, Clockwise, radians) and distance value of the coverted coordinate
function cartesianToPolar(x,y)
    local angle, distance = math.atan(x,-y), math.sqrt(x^2+y^2)
    return angle, distance
end
---@endsection

---@section polarToCartesian
--Converts polar coordinates to cartesian coordinates
---@param angle number The angle for conversion (North 0, Clockwise, radians)
---@param distance number The distance for conversion
---@return number x, number y The x and y value of the coverted coordinate
function polarToCartesian(angle,distance)
    local x, y = distance*math.sin(angle), -distance*math.cos(angle)
    return x, y
end
---@endsection

---@section bitTableToBoolTable
--Converts an table of 1,s and 0's into a table of true and false
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
---@endsection

---@section intToBits
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
---@endsection

---@section readBits
--Extracts an integer with the binary equivilent of the designated part of the data input
---@param data number The integer to extract the bits from
---@param startBit number The position of the MSB that you want to extract
---@param numberOfBits number The number of bits to extract
---@return number bitValue The integer with the binary equivilent of the designated part of the data input
function readBits(data, startBit, numberOfBits)
    local bitValue = 0
    for i = 1, numberOfBits, 1 do
        bitValue = bitValue << 1
        bitValue = bitValue|((data >> startBit-i)&1)
    end
    return bitValue
end
---@endsection

---@section writeBits 
--FIXME
--Extracts an integer with the binary equivilent of the designated part of the data input
---@param data number The integer to write the bits too
---@param bitMSB number The position of the MSB that you want to write
---@param bitLSB number The position of the LSB that you want to write
---@param bits number The integer reprisenting the bits to write
---@return number bitValue The integer with the bits written to it
function writeBits(data, bitMSB, bitLSB, bits)
    local data = data or 0                                --Makes sure data is not nil
    local mask = 0
    for i = 0, bitMSB-bitLSB, 1 do
        mask = mask | (1 << (i))
    end
    mask = mask << bitLSB-1
    mask = ~mask
    return data & mask | ((bits  or 0) << (bitLSB - 1))
end
---@endsection
