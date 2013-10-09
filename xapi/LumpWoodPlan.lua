function LumbWood:execute()
  print("Executing LumbWood")
  return self:mineBlock(INV.WOOD)
end

function LumbWood:mineBlock(b)
    print("Mining LumbWood")
  dir = Instruction.searchFor(b)
  result = self:mine(dir)
  print("result "..result)
  if ( result and self:moveTo(dir) ) then return 1 + self:mineBlock(b) end
  print ("Have not found any further blocks "..b)
  return 0
end

function LumbWood:mine(dir)
  if dir == Block.DIR_F then return turtle.dig() end
  if dir == Block.DIR_D then return turtle.digDown() end
  if dir == Block.DIR_U then return turtle.digUp() end
  return -1
end

