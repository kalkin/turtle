os.loadAPI("plans/FuelUpPlan")
os.loadAPI("plans/LumberTree")
os.loadAPI("plans/INV")
-- os.loadAPI("Block")

location = { 
  x = 0,
  y = 0,
  z = 0
}
  
local WORLD_DOMINATION_STATE = 0
  
 
local up = 1
local front = 0
local down = -1
inv = {
  wood = 1
}

local state = {
  [0] = { name = "Fuel up", desc = "Place some fuel (i.e. coal) in slot 1 to power me up",  h = InitalFuel}, 
  [1] = { name = "Bootstrap", desc = "We are alone and have to rebuild the world?\n We just need a tree." }
}

function InitialFuel() 
  turtle.refuel(1)
end


WorldDominationPlan = Plan.getPlan()
local w = WorldDominationPlan:new{ 
  plans = {
   -- FuelUpPlan.getPlan(),
  --  LumberTree.getPlan(),
  },
  name = "World Domination Plan", 
  desc = "So again, we left alone on some god forsacken rock, My Great Master...\nI will civilize this place for you\n"
}



function farm(blockType)
  direction = Block.checkFor(blockType)
end



    


w:start()