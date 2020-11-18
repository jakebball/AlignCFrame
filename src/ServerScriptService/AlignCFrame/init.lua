local AlignCFrame = {}
AlignCFrame.__index = AlignCFrame

--[[
	AlignCFrame is a simple to use align object designed to remove the need of having to create 
	and manage align position and align orientation seperately. This also has other useful features 
	such as the ability to pause the align and then resume it later.

	AlignCFrame:
	
	 -new(Instance parentInstance, CFrame optionalStartingCFrame)
	 -setCFrame(CFrame newCFrame)
	 -setPosition(Vector3 newPosition)
	 -setOrientation(Vector3 newOrientation)
	 -setForce(int newForce)
	 -setTorque(int newTorque)
	 -pause()
	 -resume()
	 -destroy()
--]]

local RunService = game:GetService("RunService")
local Maid = require(script.Maid)

function AlignCFrame.new(parentInstance, optionalStartingCFrame)
	assert(typeof(parentInstance) == "Instance", "parentInstance must be of type Instance")
	local self = setmetatable({}, AlignCFrame)
	
	local alignPosition = Instance.new("AlignPosition")
	alignPosition.Parent = parentInstance
	local alignOrientation = Instance.new("AlignOrientation")
	alignOrientation.Parent = parentInstance
	
	self._maid = Maid.new()
	
	self._a0 = Instance.new("Attachment")
	self._a0.Parent = parentInstance
	
	self._attachmentPart = Instance.new("Part")
	self._attachmentPart.Anchored = true
	self._attachmentPart.CanCollide = false
	self._attachmentPart.Transparency = 1
	self._attachmentPart.Size = Vector3.new(.5,.5,.5)	
	self._attachmentPart.Parent = workspace
	
	self._a1 = Instance.new("Attachment")
	self._a1.Parent = self._attachmentPart
	
	self._maid:GiveTask(self._a0)
	self._maid:GiveTask(self._a1)
	
	alignPosition.Attachment0 = self._a0
	alignPosition.Attachment1 = self._a1
	
	alignOrientation.Attachment0 = self._a0
	alignOrientation.Attachment1 = self._a1
	
	if optionalStartingCFrame then
		assert(typeof(optionalStartingCFrame) == "CFrame", "optionalStartingCFrame must be of type CFrame")
		self._attachmentPart.CFrame = optionalStartingCFrame
	end
	
	return self
end

function AlignCFrame:setCFrame(newCFrame)
	
end

function AlignCFrame:setPosition(newPosition)
	
end

function AlignCFrame:setOrientation(newOrientation)
	
end

function AlignCFrame:setForce(newForce)
	self._maid:DoCleaning()
end

function AlignCFrame:pause()
	
end

function AlignCFrame:resume()
	
end

function AlignCFrame:Destroy()
	
end

return AlignCFrame