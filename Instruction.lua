DIR_U = 3
DIR_F = 2
DIR_D = 1

Instruction = {
  name = "Basic Ins",
  desc = "Just a basic instruction",
  err = "Execute method not implemented",
  state = "[ ]",
  debug = true
}

function Instruction:execute() 
  return false
end

function Instruction:printState()
  print(self:getState())
end

function Instruction:getState()
  return self.name .. " " .. self.state .. "\n"
end

 
function Instruction:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
 
  return o
end

function searchFor(block) 
  turtle.select(block)
  print("Starting search for block " .. block) 
  if turtle.compare() then return DIR_F end
  if turtle.compareUp() then return DIR_U end
  if turtle.compareDown() then return DIR_D end
  if debug then print("Not found block" .. block) end
  return false; 
   
end

function moveTo(dir)
  if dir == DIR_F then return turtle.forward() end
  if dir == DIR_D then return turtle.down() end
  if dir == DIR_U then return turtle.up() end
end



function new() return Instruction:new() end
