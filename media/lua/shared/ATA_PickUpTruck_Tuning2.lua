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
NewCarTuningTable["PickUpTruck"] = {
    addPartsFromVehicleScript = {"ATA_PickUpTruck", "ATA_WheelProtection"},
    parts = {}
}

NewCarTuningTable["PickUpTruck"].parts["ATA2Bumper"] = {
    Bumper2 = {
        icon = "media/ui/tuning2/van_bullbar_2.png",
        name = "IGUI_ATA2_Bumper_Winch",
        category = "Bumpers",
        secondModel = "ATA_PickUpTruck_Bumper_Lights",
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            --transmitFirstItemCondition = true,
            use = {
                MetalPipe = 2,
                SmallSheetMetal = 2,
                MetalBar=2,
                Screws=4,
                BlowTorch = 10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 3,
                MetalWelding = 4,
            },
            recipes = {"Basic Mechanics"},
            time = 20, 
        },
        uninstall = {
            weight = "auto",
            animation = "ATA_PickLock",
            use = {
                BlowTorch=6,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 2,
            },
            recipes = {"Basic Mechanics"},
            --transmitConditionOnFirstItem = true,
            result = "auto",
            time = 20,
        }
    },
    Bumper1 = {
        icon = "media/ui/tuning2/van_bullbar_1.png",
        name = "IGUI_ATA2_Bullbar",
        category = "Bumpers",
        secondModel = "ATA_PickUpTruck_Bumper_Lights",
        protection = {"HeadlightLeft", "HeadlightRight"},
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            --transmitFirstItemCondition = true,
            use = {
                MetalPipe = 2,
                SmallSheetMetal = 3,
                SheetMetal = 2,
                MetalBar=4,
                Screws=4,
                BlowTorch = 10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 4,
                MetalWelding = 6,
            },
            recipes = {"Basic Mechanics"},
            time = 20, 
        },
        uninstall = {
            animation = "ATA_PickLock",
            use = {
                BlowTorch=6,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 2,
            },
            recipes = {"Basic Mechanics"},
            --transmitConditionOnFirstItem = true,
            result = "auto",
            time = 20,
        }
    },
    Bumper3 = {
        icon = "media/ui/tuning2/van_bullbar_3.png",
        name = "IGUI_ATA2_Bumper_Lethal",
        category = "Bumpers",
        secondModel = "ATA_PickUpTruck_Bumper_Lights",
        protection = {"EngineDoor", "HeadlightLeft", "HeadlightRight"}, 
        removeIfBroken = true,
        install = {
            weight = "auto",
            animation = "ATA_PickLock",
            use = {
                MetalPipe = 4,
                SmallSheetMetal = 5,
                SheetMetal = 2,
                MetalBar=2,
                Screws=4,
                BlowTorch = 10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 4,
                MetalWelding = 8,
            },
            recipes = {"Basic Mechanics", carRecipe},
            time = 65, 
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenLow",
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
            time = 65,
        }
    }
}

NewCarTuningTable["PickUpTruck"].parts["ATA2ProtectionWindowFrontLeft"] = {
    Default = {
        icon = "media/ui/tuning2/protection_window_side.png",
        category = "Protection",
        protection = {"WindowFrontLeft"},
        removeIfBroken = true,
        disableOpenWindowFromSeat = "SeatFrontLeft",
        install = {
            weight = "auto",
            use = {
                MetalBar = 4,
                BlowTorch = 4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                MetalWelding = 3,
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

NewCarTuningTable["PickUpTruck"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["PickUpTruck"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["PickUpTruck"].parts["ATA2ProtectionWindowFrontRight"].Default.protection = {"WindowFrontRight"}
NewCarTuningTable["PickUpTruck"].parts["ATA2ProtectionWindowFrontRight"].Default.disableOpenWindowFromSeat = "SeatFrontRight"
NewCarTuningTable["PickUpTruck"].parts["ATA2ProtectionWindowFrontRight"].Default.install.requireInstalled = {"WindowFrontRight"}

NewCarTuningTable["PickUpTruck"].parts["ATA2ProtectionWindshield"] = {
    Default = {
        icon = "media/ui/tuning2/protection_window_windshield.png",
        category = "Protection",
        protection = {"Windshield"},
        removeIfBroken = true,
        install = {
            weight = "auto",
            area = "TireFrontLeft",
            use = {
                MetalPipe = 2,
                SheetMetal = 3,
                SmallSheetMetal = 4,
                MetalBar = 4,
                Screws = 8,
                BlowTorch = 8,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 4,
            },
            recipes = {carRecipe},
            requireInstalled = {"Windshield"},
            time = 65, 
        },
        uninstall = {
            area = "TireFrontLeft",
            animation = "ATA_Crowbar_DoorLeft",
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            result = "auto",
            time = 65,
        }
    }
}

NewCarTuningTable["PickUpTruck"].parts["ATA2ProtectionWindshieldRear"] = {
    Default = {
        icon = "media/ui/tuning2/protection_window_windshield.png",
        category = "Protection",
        protection = {"WindshieldRear"},
        removeIfBroken = true,
        install = {
            weight = "auto",
            use = {
                MetalBar = 15,
                BlowTorch = 10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
            },
            skills = {
                MetalWelding = 4,
            },
            recipes = {carRecipe},
            requireInstalled = {"WindshieldRear"},
            time = 65, 
        },
        uninstall = {
            area = "TireRearRight",
            animation = "ATA_IdleLeverOpenMid",
            tools = {
                both = "Base.Crowbar",
            },
            result = "auto",
            time = 65,
        }
    }
}

NewCarTuningTable["PickUpTruck"].parts["ATA2ProtectionWheels"] = { -- не забыть сделать особые настройки колес
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

NewCarTuningTable["PickUpTruckLights"] = NewCarTuningTable["PickUpTruck"]
NewCarTuningTable["PickUpTruckLightsFire"] = NewCarTuningTable["PickUpTruck"]
NewCarTuningTable["PickUpTruckMccoy"] = NewCarTuningTable["PickUpTruck"]

ATA2Tuning_AddNewCars(NewCarTuningTable)
