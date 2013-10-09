state = {
  debug = false;
  }

function init() 
   
   apisToLoad = {"Instruction", "Plan", "INV", "Block"}

  for _, api in pairs(apisToLoad) do
    if fs.exists("xapi/"..api) then fs.delete("xapi/"..api) end
    fs.copy("xapi/"..api..".lua", "xapi/"..api)
    if os.loadAPI("xapi/"..api) then
      if debug then print("Loaded API " .. api) end
    else
      print("Error could not load API: from ".. newPath)
    end
    
  end  
end

  
init()

LumbWood = Instruction.new()

function LumbWood:execute()
  print("Executing LumbWood")
  turtle.select(1)
  turtle.refuel(1)
  turtle.select(1)
  turtle.dig() 
  turtle.forward()
  return self:mineBlock(INV.WOOD)
end

function LumbWood:mineBlock(b)
    print("Mining LumbWood")
  dir = Instruction.searchFor(b)
  result = 0;
  while dir do 
    if ( self:mine(dir) and self:moveTo(dir) ) then 
      result = result + 1
      dir = Instruction.searchFor(b)
    else 
      print ("Have not found any further blocks "..b)
      dir = false
    end
  end
  return result;
end

function LumbWood:mine(dir)
  if dir == Block.DIR_F then return turtle.dig() end
  if dir == Block.DIR_D then return turtle.digDown() end
  if dir == Block.DIR_U then return turtle.digUp() end
  return false
end

function LumbWood:moveTo(dir)
  if dir == Block.DIR_F then return turtle.forward() end
  if dir == Block.DIR_D then return turtle.down() end
  if dir == Block.DIR_U then return turtle.up() end
end

l = LumbWood:new{name = "LumbWood"}


NewPlan = Plan.new();

p = NewPlan:new{name = "First Plan", stack = {l} }
p:start()
print(textutils.serialize(p))
--p:printStack()
