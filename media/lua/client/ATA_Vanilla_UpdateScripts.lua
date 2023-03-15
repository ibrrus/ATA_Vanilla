require "ATA2ProtectionTuningTable"

ATA2TuningTable["CarStationWagon"] = {
    addPartsFromVehicleScript = "ATA_CarStationWagon",
    parts = {
        ATA2ProtectionWindowFrontLeft = {
            Default = {
                texture = "media/ui/tuning2/roof_base.png",
                name = "IGUI_ATA2ProtectionWindowFrontLeft",
                category = "",
                needRecipeToInstall = "",
                protection = {"WindowFrontLeft"},
                install = {
                    use = {
                        MetalBar = 2,
                        BlowTorch = 2,
                    },
                    tools = {
                        bodylocation = "Base.WeldingMask",
                        primary = "Base.Screwdriver",
                        secondary = "Base.Wrench",
                    },
                    skills = {
                        MetalWelding = 2,
                    },
                    recipes = {"Advanced Mechanics", "Basic Tuning"},
                    requireInstalled = {"WindowFrontLeft", "WindowFrontRight"},
                    requireUninstalled = {"EngineDoor"},
                    time = 350,
                },
                uninstall = {
                    use = {
                        BlowTorch = 2,
                    },
                    tools = {
                        primary = "Screwdriver",
                        secondary = "Wrench",
                        bodylocation = "WeldingMask",
                    },
                    skills = {
                        MetalWelding = 2,
                    },
                    result = {
                        MetalBar = 2,
                    },
                    time = 350,
                }
            },
            Default2 = {
                texture = "media/ui/tuning2/roof_light.png",
                name = "IGUI_ATA2ProtectionWindowFrontRight",
                category = "ATA2ProtectionWindow",
                protection = {"WindowFrontRight"},
                install = {
                    use = {
                        MetalBar = 10,
                        BlowTorch = 20,
                    },
                    tools = {
                        primary = "Screwdriver",
                        secondary = "Wrench",
                        bodylocation = "WeldingMask",
                    },
                    skills = {
                        MetalWelding = 2,
                    },
                    recipes = {"Advanced Mechanics", "Basic Tuning"},
                    time = 350,
                },
                uninstall = {
                    use = {
                        BlowTorch = 4,
                    },
                    tools = {
                        primary = "Screwdriver",
                        secondary = "Wrench",
                        bodylocation = "WeldingMask",
                    },
                    skills = {
                        MetalWelding = 2,
                    },
                    result = {
                        MetalBar = 2,
                    },
                    time = 350,
                }
            }
        },
        ATA2ProtectionWindowFrontRight = {
            Default = {
                texture = "media/ui/tuning2/roof_tent.png",
                name = "IGUI_ATA2ProtectionWindowFrontLeft_1",
                category = "ATA2ProtectionWindow",
                needToBeLearn = false,
                protection = {"WindowFrontLeft"},
                install = {
                    use = {
                        SmallSheetMetal = 10,
                        MetalPipe = 20,
                    },
                    tools = {
                        primary = "Screwdriver",
                        secondary = "Wrench",
                        bodylocation = "WeldingMask",
                    },
                    skills = {
                        MetalWelding = 2,
                    },
                    recipes = {"Advanced Mechanics", "Basic Tuning"},
                    time = 350,
                },
                uninstall = {
                    use = {
                        BlowTorch = 3,
                    },
                    tools = {
                        primary = "Screwdriver",
                        secondary = "Wrench",
                        bodylocation = "WeldingMask",
                    },
                    skills = {
                        MetalWelding = 2,
                    },
                    result = {
                        MetalBar = 2,
                    },
                    time = 350,
                }
            },
            Default2 = {
                texture = "media/ui/tuning2/bullbar_1.png",
                name = "IGUI_ATA2ProtectionWindowFrontLeft_2",
                category = "ATA2ProtectionWindow",
                protection = {"WindowFrontLeft"},
                install = {
                    use = {
                        MetalPipe = 10,
                        MetalBar = 20,
                    },
                    tools = {
                        primary = "Screwdriver",
                        secondary = "Wrench",
                        bodylocation = "WeldingMask",
                    },
                    skills = {
                        MetalWelding = 2,
                    },
                    recipes = {"Advanced Mechanics", "Basic Tuning"},
                    time = 350,
                },
                uninstall = {
                    BlowTorch = 20,
                    tools = {
                        primary = "Screwdriver",
                        secondary = "Wrench",
                        bodylocation = "WeldingMask",
                    },
                    skills = {
                        MetalWelding = 2,
                    },
                    result = {
                        MetalBar = 2,
                    },
                    time = 350,
                }
            }
        }
    }
}
ATA2TuningTable["CarStationWagon2"] = ATA2TuningTable["CarStationWagon"]

Events.OnGameBoot.Add(function () 
    local scriptManager = getScriptManager()
    local vehicleScripts = scriptManager:getAllVehicleScripts()
    for i = 0, vehicleScripts:size()-1 do
        local script = vehicleScripts:get(i)
        local name = script:getName()
        if ATA2TuningTable[name] and ATA2TuningTable[name].addPartsFromVehicleScript then
            local vehicleScript = scriptManager:getVehicle(ATA2TuningTable[name].addPartsFromVehicleScript)
            if vehicleScript then
                script:copyPartsFrom(vehicleScript, "*")
            end
        end
    end
end)
