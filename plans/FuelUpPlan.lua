FuelUpPlan = Plan.new()

function FuelUpPlan:execute()
  return turtle.refuel(1)
end

function new() 
  return FuelUpPlan:new{
      name = "Initial Fuell Up",
      desc = "Filling my tanks and firing up",
      help = "My Great Master! I beg you to place some fuell in my first slot, so I can build the imperium for you",
    } 
end
  
