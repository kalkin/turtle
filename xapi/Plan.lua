


Plan = { 
  name = "Basic Plan",
  desc = "Just a basic plan",
  stack = {}, -- instructions stack
  cur = false, -- pointer to current instruction
  help = "Default Help", -- help string
  debug = true,
  }
  
function Plan:new(o)
  o = o or {} -- create object if there is no provided
  setmetatable(o, self)
  self.__index = self
  return o
end

function new()
  return Plan:new()
end



function Plan:printHelp()
  if self.help then
    print(self.help)
  end
    
end

function Plan:start()
  print ("S: " .. self.name)
  if table.getn(self.stack) > 0 then 
    local result = false;
    for k, p in ipairs(self.stack) do
      self.cur = k
      print ("Ex Ins: " .. p.name)
      result = p:execute()
      if  result then 
        p.state = "[X]"
      else
        self.cur.state = "[E]"
        print (p.err)
      end
      if debug then print(p.g.." | "..result .. " | ") end
    end
  else 
    self:printHelp()
    return false
  end
end

function Plan:printStack()
  print("Stack of " .. self.name )
  for k,v in pairs(self.stack) do
    v:printState()
  end
end
