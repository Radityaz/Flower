extends Panel

@onready var Unselected = load("res://theme/PrimaryTheme.tres")
@onready var Selected = load("res://theme/SecondaryTheme.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if (Game.flower1[0] > 0):
		$MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/DaisyTheme.visible = true
		if (Game.currentselecttheme == 0):
			$MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/DaisyTheme.theme = Selected
		else:
			$MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/DaisyTheme.theme = Unselected
	else:
		$MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/DaisyTheme.visible = false

	if (Game.flower2[0] > 0):
		$MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/RoseTheme.visible = true
		if (Game.currentselecttheme == 1):
			$MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/RoseTheme.theme = Selected
		else:
			$MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/RoseTheme.theme = Unselected
	else:
		$MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/RoseTheme.visible = false



func _on_daisy_theme_pressed():
	Game.changetheme(0)


func _on_rose_theme_pressed():
	Game.changetheme(1)

