LumberWood = Instruction.new()

function LumberWood:execute()
  if debug then print("Executing LumberWood") end
  return self:mineBlock(INV.WOOD)
end

function LumberWood:mineBlock(b)
  if debug then print("Mining LumberWood") end
  dir = Instruction.searchFor(b)
  result = self:mine(dir)
  if debug then print(result)
  if  result and self:moveTo(dir)  then 
    return 1 + self:mineBlock(b) 
  end
  if debug then print ("Have not found any further blocks "..b) end
  return false
end

function LumberWood:mine(dir)
  if dir == self.DIR_F then return turtle.dig() end
  if dir == self.DIR_D then return turtle.digDown() end
  if dir == self.DIR_U then return turtle.digUp() end
  return false
end


function new()
    return LumberWood:new{name = "LumberWood"}
end
