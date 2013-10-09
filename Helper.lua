debug = true
function loadDependecies(path)
    local binPath = path.."bin/"
    local srcPath = path
    local apisToLoad = {"Instruction", "Plan", "INV", "plans/LumberTree", "plans/FuelUpPlan"}
    if fs.exists(binPath) then fs.delete(binPath) end
    fs.makeDir(binPath)
    fs.makeDir(binPath.."/plans")

    for _, api in pairs(apisToLoad) do
        fs.copy(srcPath..api..".lua", binPath..api)
        if os.loadAPI(binPath..api) then
            if debug then print("Loaded API " .. api) end
        else
            print("Error could not load API: from ".. binPath..api)
        end
    end  
end

