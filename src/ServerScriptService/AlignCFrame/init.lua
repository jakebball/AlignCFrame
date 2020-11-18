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
	 -setForce(number newForce)
	 -setTorque(number newTorque)
	 -pause()
	 -resume()
	 -destroy()
--]]

local Maid = require(script.Maid)

function AlignCFrame.new(parentInstance, optionalStartingCFrame)
	assert(typeof(parentInstance) == "Instance", "parentInstance must be of type Instance")
	local self = setmetatable({}, AlignCFrame)
	
	self._savedCFrames = {}
	self.isPaused = false

	self._alignPosition = Instance.new("AlignPosition")
	self._alignPosition.Parent = parentInstance
	self._alignOrientation = Instance.new("AlignOrientation")
	self._alignOrientation.Parent = parentInstance
	
	self._maid = Maid.new()
	
	self._a0 = Instance.new("Attachment")
	self._a0.Parent = parentInstance
	
	self._attachmentPart = Instance.new("Part")
	self._attachmentPart.Anchored = true
	self._attachmentPart.CanCollide = false
	self._attachmentPart.Transparency = 1
	self._attachmentPart.Size = Vector3.new(.5,.5,.5)	
	self._attachmentPart.Parent = workspace
	self._attachmentPart.CFrame = parentInstance.CFrame
	
	self._a1 = Instance.new("Attachment")
	self._a1.Parent = self._attachmentPart
	
	self._maid:GiveTask(self._a0)
	self._maid:GiveTask(self._a1)
	self._maid:GiveTask(self._attachmentPart)
	self._maid:GiveTask(self._alignOrientation)
	self._maid:GiveTask(self._alignPosition)
	
	self._alignPosition.Attachment0 = self._a0
	self._alignPosition.Attachment1 = self._a1
	
	self._alignOrientation.Attachment0 = self._a0
	self._alignOrientation.Attachment1 = self._a1
	
	if optionalStartingCFrame then
		assert(typeof(optionalStartingCFrame) == "CFrame", "optionalStartingCFrame must be of type CFrame")
		self._attachmentPart.CFrame = optionalStartingCFrame
	end
	
	return self
end

function AlignCFrame:setCFrame(newCFrame)
	assert(typeof(newCFrame) == "CFrame", "newCFrame must be of type CFrame")
	self._attachmentPart.CFrame = newCFrame
end

function AlignCFrame:setPosition(newPosition)
	assert(typeof(newPosition) == "Vector3", "newPosition must be of type Vector3")
	self._attachmentPart.CFrame = CFrame.new(newPosition)
end

function AlignCFrame:setOrientation(newOrientation)
	assert(typeof(newOrientation) == "Vector3", "newOrientation must be of type Vector3")
	self._attachmentPart.CFrame = self._attachmentPart.CFrame * CFrame.Angles(math.rad(newOrientation.X), math.rad(newOrientation.Y), math.rad(newOrientation.Z))
end

function AlignCFrame:setForce(newForce)
	assert(typeof(newForce) == "number", "newForce must be of type number")
	self._alignPosition.MaxForce = newForce
end

function AlignCFrame:setMaxVelocity(newVelocity)
	assert(typeof(newVelocity) == "number", "newVelocity must be of type number")	
	self._alignPosition.MaxVelocity = newVelocity
end

function AlignCFrame:setMaxTorque(newTorque)
	assert(typeof(newTorque) == "number", "newTorque must be of type number")	
	self._alignOrientation.MaxTorque = newTorque
end

function AlignCFrame:setMaxAngularVelocity(newAngularVelocity)
	assert(typeof(newAngularVelocity) == "number", " newAngularVelocity must be of type number")	
	self._alignOrientation.MaxAngularVelocity = newAngularVelocity
end

function AlignCFrame:pauseAlignment()
	self.isPaused = true
	self._alignPosition.Enabled = false
	self._alignOrientation.Enabled = false
end

function AlignCFrame:resumeAlignment()
	self.isPaused = false
	self._alignPosition.Enabled = true
	self._alignOrientation.Enabled = true
end

function AlignCFrame:saveAlignment(saveName)
	assert(typeof(saveName) == "string", "saveName must be of type string")
	self._savedCFrames[saveName] = self._attachmentPart.CFrame
end

function AlignCFrame:loadAlignment(saveName)
	assert(typeof(saveName) == "string", "saveName must be of type string")
	if(self._savedCFrames[saveName])then
		self._attachmentPart.CFrame = self._savedCFrames[saveName]
	else
		warn("attempted to load an invalid alignment - "..saveName)
	end
end

function AlignCFrame:deleteAlignment(saveName)
	assert(typeof(saveName) == "string", "saveName must be of type string")
	if(self._savedCFrames[saveName])then
		self._savedCFrames[saveName] = nil
	else
		warn("attempted to delete an invalid alignment - "..saveName)
	end
end

function AlignCFrame:destroy()
	self._maid:DoCleaning()
end

return AlignCFrame