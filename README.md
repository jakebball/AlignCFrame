# AlignCFrame
AlignCFrame is a simple and easy to use substitute for AlignPosition and AlignOrientation. It gives you the ability to control an instances CFrame without having to do make new AlignPosition and AlignOrientation object separately while also adding extra features including pausing and resuming certain alignments and then saving them to be used later during the play session! 

# Where to download
Since the script is very lightweight you can simply copy the source code from the AlignCFrame file in the src folder

# How to use:

To start you must first create the object itself with ```AlignCFrame.new(parentInstace, optionalStartingCFrame)``` which passes the instance that is being aligned and an optional starting cframe to align to. To destroy the object simply use the command ```:destroy()```

To change the physics aspect of the alignment you can simply them using these commands:

```setCFrame(CFrame newCFrame)```
```setPosition(Vector3 newPosition)```
```setOrientation(Vector3 newOrientation)```
```setForce(number newForce)```
```setMaxVelocity(number newVelocity)```
```setTorque(number newTorque)```
```setMaxTorque(number newMaxTorque)```

```setMaxAngularVelocity(number newMaxAngularVelocity)```

If you want to pause the alignment simply use the command ```pause()``` which will stop the current alignment from moving the instance and will resume with the ```resume()``` command. You can also save alignments to be used later with the ```saveAlignment(string saveName)``` which passes the save name to be used to load it later on. To load the alignment simply call ```loadAlignment(string saveName)``` which passes the alignment name to be loaded. The alignments do not save outside of the current server.

