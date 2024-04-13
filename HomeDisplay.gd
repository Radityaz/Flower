extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Game.flower1[0] > 0):
		$Panel/MainBubble.visible = true
	else:
		$Panel/MainBubble.visible = false
	
	if (Game.flower2[0] > 0):
		$HBoxContainer/MarginContainer/CostumeButton.visible = true
	else:
		$HBoxContainer/MarginContainer/CostumeButton.visible = false
