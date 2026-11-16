extends Node

# When you receive LightSwitch, turn the lights on or off depending of their state in ALL rooms

signal LightSwitch



# Call this function to interact with the button
func switchLight() -> void:
	LightSwitch.emit()
