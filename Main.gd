extends Control

# HomeDisplay,ShopDisplay,FlowerDisplay
@onready var NodePage = ["MarginContainer/VBoxContainer/HomeDisplay","MarginContainer/VBoxContainer/ShopDisplay","MarginContainer/VBoxContainer/FlowerDisplay"]
@onready var PopUpPage = ["CostumizeDisplay"] 

@onready var NodePageSelected = [true,false,false]
@onready var PopUpPageSelected = [false]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_main_bubble_pressed():
	Game.bubble += Game.upgrade1[1];


func currentpage(Parameter):

	NodePageSelected = Parameter

	for i in range(0,NodePageSelected.size(),1):
		get_node(NodePage[i]).visible = NodePageSelected[i]


func _on_home_button_pressed():
	currentpage([true,false,false])


func _on_shop_button_pressed():
	currentpage([false,true,false])


func _on_timer_timeout():
	Game.bubble += Game.BPS;


func _on_shop_button_2_pressed():
	currentpage([false,false,true])



func _on_costume_button_pressed():
	$CostumizeDisplay.visible = true


func _on_button_pressed():
	$CostumizeDisplay.visible = false
