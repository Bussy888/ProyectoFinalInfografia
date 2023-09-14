extends CanvasLayer

func level(num):
	$CurrentLevel.text = "Level: " + str(num)
	
func gems(num):
	$GemsLabel.text = "Gems: " + str(num)
	
func lives(num):
	$CurrentLives.text = "Lives: " + str(num)
