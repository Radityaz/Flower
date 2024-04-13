extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_main_bubble_pressed():
	Game.bubble += Game.upgrade1[1];



func _on_home_button_pressed():
	$MarginContainer/VBoxContainer/HomeDisplay.visible = true
	$MarginContainer/VBoxContainer/ShopDisplay.visible = false
	$MarginContainer/VBoxContainer/FlowerDisplay.visible = false

	


func _on_shop_button_pressed():
	$MarginContainer/VBoxContainer/HomeDisplay.visible = false
	$MarginContainer/VBoxContainer/ShopDisplay.visible = true
	$MarginContainer/VBoxContainer/FlowerDisplay.visible = false
	


func _on_timer_timeout():
	Game.bubble += Game.BPS;


func _on_shop_button_2_pressed():
	$MarginContainer/VBoxContainer/HomeDisplay.visible = false
	$MarginContainer/VBoxContainer/ShopDisplay.visible = false
	$MarginContainer/VBoxContainer/FlowerDisplay.visible = true


func _on_costume_button_pressed():
	$CostumizeDisplay.visible = true


func _on_button_pressed():
	$CostumizeDisplay.visible = false
