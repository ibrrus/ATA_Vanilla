require "ATA2TuningTable"

local function copy(obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
  return res
end

local carRecipe = "Basic Tuning"

local NewCarTuningTable = {}
NewCarTuningTable["Van"] = {
    addPartsFromVehicleScript = {"ATA_Van", "ATA_WheelProtection"},
    parts = {}
}

NewCarTuningTable["Van"].parts["ATA2Bullbar"] = {
    ATAVanDeRumbaBullbar1 = {
        icon = "media/ui/tuning2/van_bullbar_1.png",
        name = "IGUI_ATA2_Bullbar",
        category = "Bullbars",
        secondModel = "ATAVanDeRumbaBullbarLights",
        protection = {"HeadlightLeft", "HeadlightRight"},
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            use = {
                MetalPipe = 4,
                MetalBar=3,
                Screws=4,
                BlowTorch = 6,
                Screws=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 3,
                Mechanics = 3,
            },
            recipes = {"Intermediate Mechanics", carRecipe},
            time = 40, 
        },
        uninstall = {
            weight = "auto",
            animation = "ATA_Crowbar_DoorLeft",
            use = {
                BlowTorch=3,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            time = 20,
        }
    },
    ATAVanDeRumbaBullbar2 = {
        icon = "media/ui/tuning2/van_bullbar_2.png",
        name = "IGUI_ATA2_Bullbar_Handmade",
        category = "Bullbars",
        secondModel = "ATAVanDeRumbaBullbarLights",
        protection = {"HeadlightLeft", "HeadlightRight"},
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            use = {
                MetalPipe = 3,
                SmallSheetMetal=2,
                MetalBar=2,
                BlowTorch = 6,
                Screws=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
                MetalWelding = 4,
            },
            recipes = {"Intermediate Mechanics", carRecipe},
            time = 40, 
        },
        uninstall = {
            animation = "ATA_Crowbar_DoorLeft",
            use = {
                BlowTorch=3,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            time = 20,
        }
    },
    ATAVanDeRumbaBullbar3 = {
        icon = "media/ui/tuning2/van_bullbar_3.png",
        name = "IGUI_ATA2_Bullbar_Plow",
        category = "Bullbars",
        secondModel = "ATAVanDeRumbaBullbarLights",
        protection = {"HeadlightLeft", "HeadlightRight", "EngineDoor"},
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            use = {
                SheetMetal = 4,
                MetalBar=4,
                BlowTorch = 7,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
                MetalWelding = 5,
            },
            requireModel = "ATAVanDeRumbaBullbar2",
            recipes = {"Intermediate Mechanics", carRecipe},
            time = 60, 
        },
        uninstall = {
            animation = "ATA_Crowbar_DoorLeft",
            use = {
                BlowTorch=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = {
                MetalPipe = 2,
                SmallSheetMetal=7,
                MetalBar=2,
                Screws=2,
            },
            time = 30,
        }
    }
}


NewCarTuningTable["Van"].parts["ATA2ProtectionHood"] = {
    Default = {
        icon = "media/ui/tuning2/van_hood_protection.png",
        category = "Protection",
        protection = {"EngineDoor"},
        install = {
            use = {
                SheetMetal = 2,
                MetalBar = 2,
                Screws = 4,
                BlowTorch = 4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 4,
            },
            recipes = {carRecipe},
            time = 55, 
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenMid",
            use = {
                BlowTorch=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = {
                SheetMetal = 1,
                MetalBar = 1,
                Screws = 3,
            },
            time = 33,
        }
    },
    Color = {
        icon = "media/ui/tuning2/van_hood_protection_color.png",
        category = "Protection",
        protection = {"EngineDoor"},
        name = "IGUI_ATA2_Caption_People_Inside",
        install = {
            animation = "ATA_IdlePainting",
            use = {
                PaintRed = 5,
                PaintWhite = 2,
            },
            tools = {
                primary = "Base.Paintbrush",
            },
            requireModel = "Default";
            time = 20, 
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenMid",
            use = {
                BlowTorch=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = {
                SheetMetal = 1,
                MetalBar = 1,
                Screws = 3,
            },
            time = 33,
        }
    }
}

NewCarTuningTable["Van"].parts["ATA2ProtectionWindshield"] = {
    Default = {
        icon = "media/ui/tuning2/van_protection_window_windshield.png",
        category = "Protection",
        protection = {"Windshield"},
        removeIfBroken = true,
        install = {
            weight = "auto",
            area = "TireFrontLeft",
            use = {
                SheetMetal = 4,
                MetalBar = 4,
                BlowTorch = 5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                MetalWelding = 4,
            },
            recipes = {carRecipe},
            requireInstalled = {"Windshield"},
            time = 45, 
        },
        uninstall = {
            area = "TireFrontLeft",
            animation = "ATA_IdleLeverOpenHigh",
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            result = "auto",
            time = 30,
        }
    }
}

NewCarTuningTable["Van"].parts["ATA2ProtectionWindshieldRear"] = {
    Default = {
        icon = "media/ui/tuning2/van_windshield_rear.png",
        category = "Protection",
        protection = {"WindshieldRear"},
        removeIfBroken = true,
        install = {
            weight = "auto",
            area = "TruckBed",
            use = {
                SheetMetal = 4,
                MetalBar = 4,
                BlowTorch = 5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                MetalWelding = 4,
            },
            recipes = {carRecipe},
            requireInstalled = {"WindshieldRear"},
            time = 45, 
        },
        uninstall = {
            area = "TruckBed",
            animation = "ATA_IdleLeverOpenHigh",
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            result = "auto",
            time = 30,
        }
    }
}

NewCarTuningTable["Van"].parts["ATA2ProtectionWindowFrontLeft"] = {
    Default = {
        icon = "media/ui/tuning2/van_protection_window_side.png",
        category = "Protection",
        protection = {"WindowFrontLeft"},
        removeIfBroken = true,
        disableOpenWindowFromSeat = "SeatFrontLeft",
        install = {
            weight = "auto",
            use = {
                SheetMetal = 2,
                MetalBar = 2,
                BlowTorch = 3,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                MetalWelding = 4,
            },
            recipes = {carRecipe},
            requireInstalled = {"WindowFrontLeft"},
            time = 65, 
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenMid",
            tools = {
                both = "Base.Crowbar",
            },
            result = "auto",
            time = 65,
        }
    }
}

NewCarTuningTable["Van"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["Van"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["Van"].parts["ATA2ProtectionWindowFrontRight"].Default.protection = {"WindowFrontRight"}
NewCarTuningTable["Van"].parts["ATA2ProtectionWindowFrontRight"].Default.disableOpenWindowFromSeat = "SeatFrontRight"
NewCarTuningTable["Van"].parts["ATA2ProtectionWindowFrontRight"].Default.install.requireInstalled = {"WindowFrontRight"}

NewCarTuningTable["Van"].parts["ATA2VisualLadder"] = {
    Default = {
        icon = "media/ui/tuning2/ladder_1.png",
        category = "Trunks",
        install = {
            area = "TruckBed",
            weight = "auto",
            use = {
                MetalPipe = 4,
                MetalBar = 6,
                BlowTorch=7,
                Screws=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 4,
            },
            recipes = {carRecipe},
            requireInstalled = {"DoorRear"},
            time = 45, 
        },
        uninstall = {
            area = "TruckBed",
            animation = "ATA_Crowbar_DoorLeft",
            use = {
                BlowTorch=5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            requireUninstalled = {"ATA2InteractiveTrunkRoofRack", "ATA2RoofBase"},
            time = 25,
        }
    }
}

NewCarTuningTable["Van"].parts["ATA2RoofBase"] = {
    Default = {
        icon = "media/ui/tuning2/van_roof_base.png",
        category = "Trunks",
        install = {
            area = "TruckBed",
            weight = "auto",
            use = {
                MetalPipe = 6,
                BlowTorch=5,
                Screws=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            requireInstalled = {"ATA2VisualLadder"},
            recipes = {carRecipe},
            skills = {
                MetalWelding = 4,
            },
            time = 50, 
        },
        uninstall = {
            area = "TruckBed",
            animation = "ATA_IdleLeverOpenHigh",
            use = {
                BlowTorch=5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            requireUninstalled = {"ATA2InteractiveTrunkRoofRack"},
            time = 30,
        }
    }
}

NewCarTuningTable["Van"].parts["ATA2InteractiveTrunkRoofRack"] = {
    ATA_Van_roof = {
        icon = "media/ui/tuning2/van_roof_rack.png",
        category = "Trunks",
        interactiveTrunk = {
            filling = {"ATA_Van_roof_bag1", "ATA_Van_roof_bag2", "ATA_Van_roof_bag3", "ATA_Van_roof_bag4", "ATA_Van_roof_bag5", "ATA_Van_roof_bag6"},
            items = {
                {
                    itemTypes = {"MetalDrum"},
                    modelNameByCount = {"ATA_Van_roof_barrel"},
                },
                {
                    itemTypes = {"PetrolCan","EmptyPetrolCan"},
                    modelNameByCount = {"ATA_Van_roof_gascan0", "ATA_Van_roof_gascan1", "ATA_Van_roof_gascan2", "ATA_Van_roof_gascan3", "ATA_Van_roof_gascan4", "ATA_Van_roof_gascan5", "ATA_Van_roof_gascan6", "ATA_Van_roof_gascan7", "ATA_Van_roof_gascan8", },
                },
            }
        },
        containerCapacity = 200,
        install = {
            area = "TruckBed",
            use = {
                MetalPipe = 5,
                SheetMetal = 10,
                MetalBar=4,
                BlowTorch = 12,
                Screws=8,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 5,
            },
            requireInstalled = {"ATA2RoofBase"},
            recipes = {carRecipe},
            time = 65, 
        },
        uninstall = {
            area = "TruckBed",
            animation = "ATA_IdleLeverOpenHigh",
            use = {
                BlowTorch=6,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            requireUninstalled = {"ATA2RoofRackToolbox"},
            time = 40,
        }
    }
}

NewCarTuningTable["Van"].parts["ATA2RoofRackToolbox"] = {
    Default = {
        icon = "media/ui/tuning2/bus_toolbox.png",
        category = "Trunks",
        containerCapacity = 40,
        install = {
            area = "TruckBed",
            use = {
                SmallSheetMetal = 11,
                BlowTorch = 7,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 6,
            },
            requireInstalled = {"ATA2InteractiveTrunkRoofRack"},
            recipes = {carRecipe},
            time = 55, 
        },
        uninstall = {
            area = "TruckBed",
            animation = "ATA_IdleLeverOpenHigh",
            use = {
                BlowTorch=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            time = 33,
        }
    }
}

NewCarTuningTable["Van"].parts["ATA2ProtectionWheels"] = { -- не забыть сделать особые настройки колес
    ATAProtection = {
        removeIfBroken = true,
        icon = "media/ui/tuning2/wheel_chain.png",
        category = "Protection", 
        protectionModel = true, 
        protection = {"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"}, 
        install = { 
            sound = "ATA2InstallWheelChain",
            use = { 
                ATAProtectionWheelsChain = 1,
                BlowTorch = 4,
            },
            tools = { 
                bodylocation = "Base.WeldingMask", 
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 2,
                MetalWelding = 3,
            },
            recipes = {"Basic Tuning"},
            requireInstalled = {"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"},
            time = 65, 
        },
        uninstall = {
            sound = "ATA2InstallWheelChain",
            use = {
                BlowTorch=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = {
                UnusableMetal=2,
            },
            time = 40,
        }
    }
}

-- NewCarTuningTable["VanSeats"] = NewCarTuningTable["Van"] -- нужна новая броня для окон
NewCarTuningTable["VanSpecial"] = NewCarTuningTable["Van"]
NewCarTuningTable["VanSpiffo"] = NewCarTuningTable["Van"]
NewCarTuningTable["Van_KnoxDisti"] = NewCarTuningTable["Van"]
NewCarTuningTable["Van_LectroMax"] = NewCarTuningTable["Van"]
NewCarTuningTable["Van_MassGenFac"] = NewCarTuningTable["Van"]
NewCarTuningTable["Van_Transit"] = NewCarTuningTable["Van"]

ATA2Tuning_AddNewCars(NewCarTuningTable)
