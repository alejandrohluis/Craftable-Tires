require 'Items/ProceduralDistributions'
require 'Items/Distributions'

-----------------------------------------Magazine-----------------------------------------
---MagazineRackMixed---
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "DP.TireMag")
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.025)
---LibraryBooks---
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "DP.TireMag")
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 0.025)
---Living Room SideTable---
table.insert(ProceduralDistributions["list"]["LivingRoomSideTableNoRemote"].items, "DP.TireMag")
table.insert(ProceduralDistributions["list"]["LivingRoomSideTableNoRemote"].items, 0.05)
---LivingRoomSideTable---
table.insert(ProceduralDistributions["list"]["LivingRoomSideTable"].items, "DP.TireMag")
table.insert(ProceduralDistributions["list"]["LivingRoomSideTable"].items, 0.05)
---Garage Metalwork---
table.insert(ProceduralDistributions["list"]["GarageMetalwork"].items, "DP.TireMag")
table.insert(ProceduralDistributions["list"]["GarageMetalwork"].items, 0.1)
---Garage Mechanics---
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "DP.TireMag")
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 1.0)
---Mechanic Shelf Books---
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, "DP.TireMag")
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, 20)
---Magazine crate---
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "DP.TireMag")
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 0.05)
-----------------------------------------Rubber-----------------------------------------
---GarageMechanics---
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "DP.Rubber")
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 5.0)
---Mechanic Shelf Wheels---
table.insert(ProceduralDistributions["list"]["MechanicShelfWheels"].items, "DP.Rubber")
table.insert(ProceduralDistributions["list"]["MechanicShelfWheels"].items, 60.0)
table.insert(ProceduralDistributions["list"]["MechanicShelfWheels"].items, "DP.Rubber")
table.insert(ProceduralDistributions["list"]["MechanicShelfWheels"].items, 15.0)
---Mechanic Special---
table.insert(ProceduralDistributions["list"]["MechanicSpecial"].items, "DP.Rubber")
table.insert(ProceduralDistributions["list"]["MechanicSpecial"].items, 20.0)

---Zombie Drops---
Distributions = Distributions or {}

SuburbsDistributions.all.Outfit_Mechanic = SuburbsDistributions.all.Outfit_Mechanic or {rolls = 1,items = {},junk= {rolls =1, items={}}}
table.insert(SuburbsDistributions["all"]["Outfit_Mechanic"].items, "DP.TireMag")
table.insert(SuburbsDistributions["all"]["Outfit_Mechanic"].items, 1)
table.insert(SuburbsDistributions["all"]["Outfit_Mechanic"].items, "DP.Rubber")
table.insert(SuburbsDistributions["all"]["Outfit_Mechanic"].items, 5)

SuburbsDistributions.all.Outfit_MetalWorker = SuburbsDistributions.all.Outfit_MetalWorker or {rolls = 1,items = {},junk= {rolls =1, items={}}}
table.insert(SuburbsDistributions["all"]["Outfit_MetalWorker"].items, "DP.TireMag")
table.insert(SuburbsDistributions["all"]["Outfit_MetalWorker"].items, 1)