extends Node
class_name MusicManager

@export var musicDict : Dictionary[String, AudioStreamPlayer]

func Play(music : String) -> void :
	for key in musicDict.keys() :
		if (music == key) :
			musicDict[key].play()
		else :
			musicDict[key].stop()
