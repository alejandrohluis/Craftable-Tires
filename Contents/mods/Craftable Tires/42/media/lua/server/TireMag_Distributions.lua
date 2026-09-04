require 'Items/ProceduralDistributions'
require 'Items/Distributions'

local procedural = ProceduralDistributions

-----------------------------------------Magazine-----------------------------------------
---MagazineRackMixed---
table.insert(procedural["list"]["MagazineRackMixed"].items, "DP.TireMag")
table.insert(procedural["list"]["MagazineRackMixed"].items, 0.025)
---LibraryBooks---
table.insert(procedural["list"]["LibraryBooks"].items, "DP.TireMag")
table.insert(procedural["list"]["LibraryBooks"].items, 0.025)
---Living Room SideTable---
table.insert(procedural["list"]["LivingRoomSideTableNoRemote"].items, "DP.TireMag")
table.insert(procedural["list"]["LivingRoomSideTableNoRemote"].items, 0.05)
---LivingRoomSideTable---
table.insert(procedural["list"]["LivingRoomSideTable"].items, "DP.TireMag")
table.insert(procedural["list"]["LivingRoomSideTable"].items, 0.05)
---Garage Metalwork---
table.insert(procedural["list"]["GarageMetalwork"].items, "DP.TireMag")
table.insert(procedural["list"]["GarageMetalwork"].items, 0.1)
---Garage Mechanics---
table.insert(procedural["list"]["GarageMechanics"].items, "DP.TireMag")
table.insert(procedural["list"]["GarageMechanics"].items, 1.0)
---Mechanic Shelf Books---
table.insert(procedural["list"]["MechanicShelfBooks"].items, "DP.TireMag")
table.insert(procedural["list"]["MechanicShelfBooks"].items, 20)
---Magazine crate---
table.insert(procedural["list"]["CrateMagazines"].items, "DP.TireMag")
table.insert(procedural["list"]["CrateMagazines"].items, 0.05)

---Zombie Drops---
Distributions = Distributions or {}

local suburbs = SuburbsDistributions

suburbs.all.Outfit_Mechanic = suburbs.all.Outfit_Mechanic or {rolls = 1,items = {},junk= {rolls =1, items={}}}
table.insert(suburbs["all"]["Outfit_Mechanic"].items, "DP.TireMag")
table.insert(suburbs["all"]["Outfit_Mechanic"].items, 1)

suburbs.all.Outfit_MetalWorker = suburbs.all.Outfit_MetalWorker or {rolls = 1,items = {},junk= {rolls =1, items={}}}
table.insert(suburbs["all"]["Outfit_MetalWorker"].items, "DP.TireMag")
table.insert(suburbs["all"]["Outfit_MetalWorker"].items, 1)