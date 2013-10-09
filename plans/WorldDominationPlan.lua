os.loadAPI("plans/Plan")

WorldDominationPlan = Plan.getPlan()
function getPlan()
  return WorldDominationPlan:new{ 
    plans = {
      FuelUpPlan.getPlan()
    },
    help = "-----------------",
    name = "World Domination Plan", 
    desc = "So again, we left alone on some god forsacken rock, My Great Master...\nI will civilize this place for you\n"
  }
end