local VanillaVehicle = {
    CarStationWagon = "ATA_CarStationWagon",
    CarStationWagon2 = "ATA_CarStationWagon",
}

Events.OnGameBoot.Add(function () 
    local scriptManager = getScriptManager()
    local vehicleScripts = scriptManager:getAllVehicleScripts()
    for i = 0, vehicleScripts:size()-1 do
        local script = vehicleScripts:get(i)
        local name = script:getName()
        print(name)
        templateName = VanillaVehicle[name]
        if templateName then
            print(templateName)
            local vehicleScript = scriptManager:getVehicle(templateName)
            if vehicleScript then
                print("copyPartsFrom")
                script:copyPartsFrom(vehicleScript, "*")
            end
        end
    end
end)
