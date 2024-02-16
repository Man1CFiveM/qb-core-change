-- local QBCore = {}
-- QBCore.Functions = {}
-- QBCore.Classes = {}

-- -- PlayAnimAsync function
-- local function PlayAnim(animDict, animName, ped, callback)
--     -- Define the error handler function
--     function handleError(errorMessage)
--         print("Error: " .. errorMessage)
--     end

--     if not ped then ped = PlayerPedId() end
--     if not DoesAnimDictExist(animDict) then 
--         handleError("Animation dictionary does not exist: " .. animDict)
--         return false, "Animation dictionary does not exist: " .. animDict
--     end

--     -- Start the animation
--     TaskPlayAnim(ped, animDict, animName, 6.0, -6.0, -1, 32, 1, true, true, true)

--     -- Check the duration of the animation
--     local duration = GetAnimDuration(animDict, animName)
--     if duration == 0 then
--         handleError("Animation does not exist: " .. animName)
--         return false, "Animation does not exist: " .. animName
--     end

--     -- Create a loop that waits until the animation is finished
--     CreateThread(function()
--         while IsEntityPlayingAnim(ped, animDict, animName, 3) do
--             Wait(0) -- Wait for 1 frame
--         end

--         -- Call the callback function when the animation is finished
--         if callback then
--             callback(duration)
--         end
--     end)

--     -- Remove the animation dictionary
--     RemoveAnimDict(animDict)

--     -- Return a function that returns the current progress of the animation
--     return function()
--         if IsEntityPlayingAnim(ped, animDict, animName, 3) then
--             local currentTime = GetEntityAnimCurrentTime(ped, animDict, animName)
--             return currentTime * duration, nil
--         else
--             return duration
--         end
--     end
-- end

-- -- QBCore.Functions.PlayAnim = PlayAnim

-- -- print('wil run right before PlayAnim() is called')
-- -- PlayAnim('missfbi4prepp1', '_bag_pickup_garbage_man', PlayerPedId(), function(time)
-- --     print('Animation finished')
-- --     print(time)
-- --     print('Run after the animation is finished')
-- --     -- Continue with the rest of your code here
-- -- end)
-- -- print('wil run right after PlayAnim() is called')





-- local function LoadModel(model)
--     if HasModelLoaded(model) then return end
--     RequestModel(model)
--     while not HasModelLoaded(model) do
--         Wait(0)
--     end
-- end

-- local function LoadAnimSet(animSet)
--     if HasAnimSetLoaded(animSet) then return end
--     RequestAnimSet(animSet)
--     while not HasAnimSetLoaded(animSet) do
--         Wait(0)
--     end
-- end

-- local function LoadParticleDict(particleDict)
--     if HasNamedPtfxAssetLoaded(particleDict) then return end
--     RequestNamedPtfxAsset(particleDict)
--     while not HasNamedPtfxAssetLoaded(particleDict) do
--         Wait(0)
--     end
-- end

-- local function LoadObject(model)
--     local obj = CreateObject(model, 0.0, 0.0, 0.0, true, true, true)
--     SetEntityAsMissionEntity(obj, true, true)
--     SetEntityAsNoLongerNeeded(obj)
-- end

-- local function LoadAnimDict(animDict)
--     if not HasAnimDictLoaded(animDict) then
--         RequestAnimDict(animDict)
--         while not HasAnimDictLoaded(animDict) do
--             Wait(0)
--         end
--     end
-- end


-- local function LoadAnimDictAsync(animDict)
--     if not HasAnimDictLoaded(animDict) then
--         RequestAnimDict(animDict)
--         while not HasAnimDictLoaded(animDict) do
--             Wait(0)
--         end
--     end
-- end

-- local function LoadParticle(animDict)
--     if not HasNamedPtfxAssetLoaded(animDict) then
--         RequestNamedPtfxAsset(animDict)
--         while not HasNamedPtfxAssetLoaded(animDict) do
--             Wait(0)
--         end
--     end
-- end

-- local function LoadStreamedTextureDict(textureDict)
--     if not HasStreamedTextureDictLoaded(textureDict) then
--         RequestStreamedTextureDict(textureDict, true)
--         while not HasStreamedTextureDictLoaded(textureDict) do
--             Wait(0)
--         end
--     end
-- end

-- local function LoadScaleform(scaleform)
--     local scaleform = RequestScaleformMovie(scaleform)
--     while not HasScaleformMovieLoaded(scaleform) do
--         Wait(0)
--     end
--     return scaleform
-- end

-- local function LoadModelAsync(model)
--     if not HasModelLoaded(model) then
--         RequestModel(model)
--         while not HasModelLoaded(model) do
--             Wait(0)
--         end
--     end
-- end

-- local function LoadAnimSetAsync(animSet)
--     if not HasAnimSetLoaded(animSet) then
--         RequestAnimSet(animSet)
--         while not HasAnimSetLoaded(animSet) do
--             Wait(0)
--         end
--     end
-- end

-- local function LoadParticleDictAsync(particleDict)
--     if not HasNamedPtfxAssetLoaded(particleDict) then
--         RequestNamedPtfxAsset(particleDict)
--         while not HasNamedPtfxAssetLoaded(particleDict) do
--             Wait(0)
--         end
--     end
-- end

-- local function LoadObjectAsync(model)
--     local obj = CreateObject(model, 0.0, 0.0, 0.0, true, true, true)
--     SetEntityAsMissionEntity(obj, true, true)
--     SetEntityAsNoLongerNeeded(obj)
-- end
