
local AlignCFrame = require(script.Parent.AlignCFrame)

local AlignCFrame = AlignCFrame.new(workspace.Red)
AlignCFrame:saveAlignment("CoolAlign")
wait(3)
AlignCFrame:setForce(1)
AlignCFrame:setMaxVelocity(1)
AlignCFrame:setMaxTorque(1)
AlignCFrame:setMaxAngularVelocity(1)