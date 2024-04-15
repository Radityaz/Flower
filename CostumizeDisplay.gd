extends Panel

@onready var Unselected = load("res://theme/PrimaryTheme.tres")
@onready var Selected = load("res://theme/SecondaryTheme.tres")

# Daisy,Rose
@onready var FlowerNodepath = ["MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/DaisyTheme"
								,"MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/RoseTheme",
								"MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/TulipTheme",
								"MarginContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/MarginContainer/GridContainer/OrchidTheme"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	# if (Game.flower1[0] > 0):
	# 	get_node(FlowerNodepath[0]).visible = true
	# else:
	# 	get_node(FlowerNodepath[0]).visible = false

	# if (Game.flower2[0] > 0):
	# 	get_node(FlowerNodepath[1]).visible = true
	# else:
	# 	get_node(FlowerNodepath[1]).visible = false

	for i in range(FlowerNodepath.size()):

		if (Game["flower" + str(i + 1) ][0] > 0):
				get_node(FlowerNodepath[i]).visible = true
		else:
				get_node(FlowerNodepath[i]).visible = false

	for i in range(FlowerNodepath.size()):
		if (Game.currentselecttheme == i):
			get_node(FlowerNodepath[i]).theme = Selected
		else:
			get_node(FlowerNodepath[i]).theme = Unselected
			

func _on_daisy_theme_pressed():
	Game.changetheme(0)


func _on_rose_theme_pressed():
	Game.changetheme(1)



func _on_tulip_theme_pressed():
	Game.changetheme(2)
	


func _on_orchid_theme_pressed():
	Game.changetheme(3)

