extends Node
class_name MusicManager


func PlayMenu() :
	$MusicMenu.play()
	$MusicEsprit.stop()
	$MusicPhysic.stop()

func PlayEsprit() :
	$MusicMenu.stop()
	$MusicEsprit.play()
	$MusicPhysic.stop()

func PlayPhysic() :
	$MusicMenu.stop()
	$MusicEsprit.stop()
	$MusicPhysic.play()
