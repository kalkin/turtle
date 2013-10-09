debug = true;

local loadedApis = {}

function init() 
    local function getRunningPath()
        local runningProgram = shell.getRunningProgram()
        local programName = fs.getName(runningProgram)
        return runningProgram:sub( 1, #runningProgram - #programName )
    end

    path = getRunningPath();
    fs.delete(path.."bin/Helper")
    fs.makeDir(path.."bin/")
    fs.copy(path.."Helper.lua", path.."bin/Helper")
    os.loadAPI(path.."bin/Helper")
    Helper.loadDependecies(path)
end

  
init()

plans = {
--    FuelUpPlan.new(),
    LumberTree.new(),
}

NewPlan = Plan.new()
p = NewPlan:new{name = "First Plan", stack = plans }
p:start()
--print(textutils.serialize(p))
--p:printStack()
