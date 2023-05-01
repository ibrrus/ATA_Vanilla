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
NewCarTuningTable["CarStationWagon"] = {
    addPartsFromVehicleScript = {"ATA_CarStationWagon", "ATA_WheelProtection"},
    parts = {}
}

NewCarTuningTable["CarStationWagon"].parts["ATA2Bumper"] = {
    Bumper2 = {
        icon = "media/ui/tuning2/jeep_bumper_2.png",
        name = "IGUI_ATA2_Bumper_Winch",
        category = "Bumpers", 
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
    Bumper3 = {
        icon = "media/ui/tuning2/jeep_bumper_3.png",
        name = "IGUI_ATA2_Bullbar",
        category = "Bumpers",
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
    Bumper4 = {
        icon = "media/ui/tuning2/jeep_bumper_4.png",
        name = "IGUI_ATA2_Bumper_Lethal",
        category = "Bumpers",
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

NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowFrontLeft"] = {
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

NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowFrontRight"].Default.protection = {"WindowFrontRight"}
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowFrontRight"].Default.disableOpenWindowFromSeat = "SeatFrontRight"
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowFrontRight"].Default.install.requireInstalled = {"WindowFrontRight"}

NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearLeft"].Default.protection = {"WindowRearLeft"}
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearLeft"].Default.disableOpenWindowFromSeat = "SeatRearLeft"
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearLeft"].Default.install.requireInstalled = {"WindowRearLeft"}
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearLeft"].Default.install.use = {
    MetalBar = 6,
    BlowTorch = 6,
}

NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearLeft"])
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearRight"].Default.protection = {"WindowRearRight"}
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearRight"].Default.disableOpenWindowFromSeat = "SeatRearRight"
NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindowRearRight"].Default.install.requireInstalled = {"WindowRearRight"}

NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindshield"] = {
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

NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWindshieldRear"] = {
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

NewCarTuningTable["CarStationWagon"].parts["ATA2RoofBase"] = {
    Default = {
        icon = "media/ui/tuning2/roof_base.png",
        category = "Trunks",
        install = {
            area = "TireFrontLeft",
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
            skills = {
                MetalWelding = 4,
            },
            time = 65, 
        },
        uninstall = {
            area = "TireFrontLeft",
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
            requireUninstalled = {"ATA2InteractiveTrunkRoofRack", "ATA2RoofTent"},
            time = 65,
        }
    }
}

NewCarTuningTable["CarStationWagon"].parts["ATA2RoofTent"] = {
    Default = {
        icon = "media/ui/tuning2/roof_tent.png",
        category = "Another",
        install = {
            weight = "auto",
            area = "TireFrontLeft",
            use = {
                Tarp = 2,
                Screws=4,
            },
            tools = {
                primary = "Base.Wrench",
            },
            requireInstalled = {"ATA2RoofBase"},
            requireUninstalled = {"ATA2InteractiveTrunkRoofRack"},
            time = 65, 
        },
        uninstall = {
            area = "TireFrontLeft",
            animation = "ATA_IdleLeverOpenHigh",
            use = {
                BlowTorch=5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            result = {
                Tarp = 2,
                Screws=3,
            },
            time = 65,
        }
    }
}

NewCarTuningTable["CarStationWagon"].parts["ATA2InteractiveTrunkRoofRack"] = {
    ATA_CarStationWagon_roofrack = {
        icon = "media/ui/tuning2/roof_rack_2.png",
        category = "Trunks",
        containerCapacity = 60,
        interactiveTrunk = {
            filling = {"ATA_CarStationWagon_roofrack_bag1", "ATA_CarStationWagon_roofrack_bag2", "ATA_CarStationWagon_roofrack_bag3"},
            items = {
                {
                    itemTypes = {"BoxOfJars"},
                    modelNameByCount = {"ATA_CarStationWagon_roofrack_BoxOfJars1", "ATA_CarStationWagon_roofrack_BoxOfJars2", },
                },
                {
                    itemTypes = {"BucketEmpty", "BucketConcreteFull", "BucketPlasterFull", "BucketWaterFull", },
                    modelNameByCount = {"ATA_CarStationWagon_roofrack_Bucket"},
                },
                {
                    itemTypes = {"FishingNet", "BrokenFishingNet", },
                    modelNameByCount = {"ATA_CarStationWagon_roofrack_FishingNet"},
                },
                {
                    itemTypes = {"Generator"},
                    modelNameByCount = {"ATA_CarStationWagon_roofrack_Generator"},
                },
                {
                    itemTypes = {"Saw",},
                    modelNameByCount = {"ATA_CarStationWagon_roofrack_Hacksaw"},
                },
                {
                    itemTypes = {"Log", "LogStacks2", "LogStacks3", "LogStacks4", "Plank", },
                    modelNameByCount = {"ATA_CarStationWagon_roofrack_Log"},
                },
                {
                    itemTypes = {"LugWrench"},
                    modelNameByCount = {"ATA_CarStationWagon_roofrack_LugWrench"},
                },
                {
                    itemTypes = {"PropaneTank"},
                    modelNameByCount = {"ATA_CarStationWagon_roofrack_PropaneTank1", "ATA_CarStationWagon_roofrack_PropaneTank2", },
                },
                {
                    itemTypes = {"TrapCage"},
                    modelNameByCount = {"ATA_CarStationWagon_roofrack_w001"},
                },
            }
        },
        install = {
            weight = "auto",
            area = "TireFrontLeft",
            use = {
                MetalPipe = 12,
                MetalBar = 4,
                BlowTorch=10,
                Screws=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 5,
            },
            recipes = {carRecipe},
            requireInstalled = {"ATA2RoofBase"},
            requireUninstalled = {"ATA2RoofTent"},
            time = 65, 
        },
        uninstall = {
            area = "TireFrontLeft",
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
            time = 65,
        }
    }
}

NewCarTuningTable["CarStationWagon"].parts["ATA2InteractiveTrunkWheelRack"] = {
    WheelRack = {
        icon = "media/ui/tuning2/wheel_rack_1.png",
        category = "Trunks",
        containerCapacity = 25,
        interactiveTrunk = {
            filling = {"Cooler"},
            items = {
                {
                    itemTypes = {"Bag_BigHikingBag", "Bag_NormalHikingBag"},
                    modelNameByCount = {"BigHikingBag"},
                },
                {
                    itemTypes = {"Jack"},
                    modelNameByCount = {"Jack"},
                },
                {
                    itemTypes = {"Extinguisher"},
                    modelNameByCount = {"Extinguisher"},
                },
                {
                    itemTypes = {"PetrolCan", "EmptyPetrolCan"},
                    modelNameByCount = {"GasCan"},
                },
                {
                    itemTypes = {"Radio.RadioBlack", "Radio.RadioRed"},
                    modelNameByCount = {"Radio"},
                },
                {
                    itemTypes = {"Bag_JanitorToolbox"},
                    modelNameByCount = {"ToolBox"},
                },
                {
                    itemTypes = {"TirePump"},
                    modelNameByCount = {"TirePump"},
                },
            }
        },
        install = {
            weight = "auto",
            use = {
                MetalPipe = 4,
                MetalBar = 4,
                BlowTorch=5,
                Screws=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 3,
            },
            recipes = {carRecipe},
            time = 40, 
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenMid",
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
            time = 40,
        }
    }
}

NewCarTuningTable["CarStationWagon"].parts["ATA2ProtectionWheels"] = { -- не забыть сделать особые настройки колес
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

NewCarTuningTable["CarStationWagon2"] = NewCarTuningTable["CarStationWagon"]

ATA2Tuning_AddNewCars(NewCarTuningTable)
