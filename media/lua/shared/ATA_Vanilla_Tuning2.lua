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
    addPartsFromVehicleScript = "ATA_CarStationWagon",
    parts = {}
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

NewCarTuningTable["CarStationWagon2"] = NewCarTuningTable["CarStationWagon"]

ATA2Tuning_AddNewCars(NewCarTuningTable)
