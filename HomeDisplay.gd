extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Game.flower1[0] > 0):
		$Panel/MainBubble.visible = true
		$HBoxContainer/MarginContainer/CostumeButton.visible = true
	else:
		$Panel/MainBubble.visible = false
		$HBoxContainer/MarginContainer/CostumeButton.visible = false
	
	
	$Panel/MainBubble.icon = load(Game.themepath[Game.currentselecttheme])

