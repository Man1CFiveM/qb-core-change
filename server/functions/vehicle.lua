
QBCore.Functions.Vehicles = {}
local TrackVehicle = {}

--- func desc
---@param hash string -- The vehicle model name
---@param vehType string -- The vehicle type
---@param coords vector4  -- The vehicle spawn coordinates
---@param cb function -- The callback function
local function Spawn(hash, vehType, coords, cb)
    if type(hash) ~= "string" then
        return false, print("Invalid argument: hash must be a string")
    end
    -- Check if coords is a table with x, y, and z fields
    if type(coords) ~= "vector4" then
        return false, print("Invalid argument: coords must be a table with x, y, and z fields")
    end
    local veh = CreateVehicleServerSetter(joaat(hash), vehType, coords.x, coords.y, coords.z, coords.w)
    local networkId = NetworkGetNetworkIdFromEntity(veh)
    TrackVehicle[networkId] = {entity = veh, hash = hash, type = vehType, coords = coords}
    if cb then
        return cb(veh, networkId)
    end
    return veh, networkId
end
QBCore.Functions.Vehicles.Spawn = Spawn

local function Delete()
    local function ByNetId(NetId)
        print('ByNetId: '..NetId)
        local veh = NetworkGetEntityFromNetworkId(NetId)
        if DoesEntityExist(veh) then
            DeleteEntity(veh)
            return true
        end
        return false
    end
    local function ByEntityId()
        print('ByEntityId')
    end
    return {ByNetId = ByNetId, ByEntityId = ByEntityId}
end

-- --- func desc
-- ---@param NetId number -- The vehicle network id
-- ---@return boolean -- Returns true if the vehicle was deleted, false if it wasn't
-- local function DeleteByNetId(NetId)
--     local veh = NetworkGetEntityFromNetworkId(NetId)
--     if DoesEntityExist(veh) then
--         DeleteEntity(veh)
--         return true
--     end
--     return false
-- end
QBCore.Functions.Vehicles.Delete = Delete

--- func desc
---@param cid number -- The player cid
---@return table -- Returns the vehicle data
local function Get(cid)
    -- check cid of player before returning vehicle
    return QBCore.Debug(TrackVehicle[cid])
end
QBCore.Functions.Vehicles.Get = Get


-- local vehClass = QBCore.Functions.CreateVehicleClass()
-- vehClass.new('adder', 'automobile', vector4(-324.43, -1527.62, 27.25, 0.0), function(veh, networkId)
--     print('QBCore.Functions.CreateVehicleClass')
--     print('Vehicle created with network id: ' .. networkId .. ' and entity id: ' .. veh)
--     vehClass.delete(networkId)
-- end)

-- local veh, networkId = vehClass.new('adder', 'automobile', vector4(-324.43, -1527.62, 27.25, 0.0))
-- print('Vehicle created with network id: ' .. networkId .. ' and entity id: ' .. veh)

-- vehClass.get(networkId)
-- Path: resources/%5Bqb%5D/qb-core/client/functions/vehicle.lua


