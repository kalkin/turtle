function getRunningPath()
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
