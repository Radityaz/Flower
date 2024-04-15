extends ScrollContainer

# [Daisy,Rose]
@onready var FlowerBuff = ["MarginContainer/VBoxContainer/DaisyFlower/MarginContainer/HBoxContainer/VBoxContainer/FlowerBuff1",
							"MarginContainer/VBoxContainer/RoseFlower/MarginContainer/HBoxContainer/VBoxContainer/FlowerBuff2", 
							"MarginContainer/VBoxContainer/TulipFlower/MarginContainer/HBoxContainer/VBoxContainer/FlowerBuff3",
							"MarginContainer/VBoxContainer/OrchidFlower/MarginContainer/HBoxContainer/VBoxContainer/FlowerBuff4"]

@onready var FlowerCost = ["MarginContainer/VBoxContainer/DaisyFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade1/HBoxContainer/FlowerLabel1",
							"MarginContainer/VBoxContainer/RoseFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade2/HBoxContainer/FlowerLabel2",
							"MarginContainer/VBoxContainer/TulipFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade3/HBoxContainer/FlowerLabel3",
							"MarginContainer/VBoxContainer/OrchidFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade4/HBoxContainer/FlowerLabel4",]

@onready var FlowerStep = ["MarginContainer/VBoxContainer/DaisyFlower/FlowerGenerate1",
							"MarginContainer/VBoxContainer/RoseFlower/FlowerGenerate2",
							"MarginContainer/VBoxContainer/TulipFlower/FlowerGenerate3",
							"MarginContainer/VBoxContainer/OrchidFlower/FlowerGenerate4"]

@onready var FlowerLabel = ["MarginContainer/VBoxContainer/DaisyFlower/MarginContainer/HBoxContainer/VBoxContainer/FlowerLabel1",
							"MarginContainer/VBoxContainer/RoseFlower/MarginContainer/HBoxContainer/VBoxContainer/Label",
							"MarginContainer/VBoxContainer/TulipFlower/MarginContainer/HBoxContainer/VBoxContainer/Label",
							"MarginContainer/VBoxContainer/OrchidFlower/MarginContainer/HBoxContainer/VBoxContainer/Label"]

@onready var FlowerButton = ["MarginContainer/VBoxContainer/DaisyFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade1",
							"MarginContainer/VBoxContainer/RoseFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade2",
							"MarginContainer/VBoxContainer/TulipFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade3",
							"MarginContainer/VBoxContainer/OrchidFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade4",]

@onready var TimerIndex
@onready var TimerRun;

@onready var UpgradeNotReady = load("res://theme/PrimaryTheme.tres")
@onready var UpgradeReady = load("res://theme/SecondaryTheme.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):

	get_node(FlowerLabel[0]).text = "Daisy Flower Lv " + str(Game.flower1[0])
	get_node(FlowerLabel[1]).text = "Rose Flower Lv " + str(Game.flower2[0])
	get_node(FlowerLabel[2]).text = "Tulip Flower Lv " + str(Game.flower3[0])
	get_node(FlowerLabel[3]).text = "Orchid Flower Lv " + str(Game.flower4[0])



	
	for i in range(FlowerBuff.size()):
		get_node(FlowerCost[i]).text = str(Game.convertnumber(floor(Game["flower" + str(i + 1)][2])))
		get_node(FlowerStep[i]).value = Game["flower" + str(i + 1)][5]
		get_node(FlowerStep[i]).max_value = Game["flower" + str(i + 1)][4]

		if (Game["flower" + str(i + 1)][0] > 0):
			Game["flower" + str(i + 1)][5] += 1 + (Game.upgrade3[1] / 100)
	

		# if (Game.flower1[0] > 0):
		# 	get_node(FlowerBuff[0]).visible = true
		# else:
		# 	get_node(FlowerBuff[0]).visible = false

	for i in range(FlowerBuff.size()):
		if (Game["flower" + str(i + 1)][0] > 0):
			get_node(FlowerBuff[i]).visible = true
		else:
			get_node(FlowerBuff[i]).visible = false

	for i in range(FlowerBuff.size()):
		if ( Game.bubble >= Game["flower" + str(i + 1)][2]):
			get_node(FlowerButton[i]).theme = UpgradeReady
		else:
			get_node(FlowerButton[i]).theme = UpgradeNotReady
			
	
	if (Game.bubble > Game.flower1[2]):
		get_node(FlowerBuff[0]).text = str(Game.flower1[1]) + " > " + str(Game.flower1[1] + Game.flower1[3]) + " x Bubble per click" 
	else:
		get_node(FlowerBuff[0]).text = str(Game.flower1[1]) + "x Bubble per click"
		
	if (Game.bubble > Game.flower2[2]):
		get_node(FlowerBuff[1]).text = str(Game.flower2[1]) + " > " + str(Game.flower2[1] + Game.flower2[3]) + " x Bubble per second" 
	else:
		get_node(FlowerBuff[1]).text = str(Game.flower2[1]) + "x Bubble per second"

	if (Game.bubble > Game.flower3[2]):
		get_node(FlowerBuff[2]).text = str(Game.flower3[1]) + " > " + str(Game.flower3[1] + Game.flower3[3]) + " x all upgrades" 
	else:
		get_node(FlowerBuff[2]).text = str(Game.flower3[1]) + "x all upgrades"

	if (Game.bubble > Game.flower4[2]):
		get_node(FlowerBuff[3]).text = str(Game.flower4[1]) + " > " + str(Game.flower4[1] + Game.flower4[3]) + " x flower level" 
	else:
		get_node(FlowerBuff[3]).text = str(Game.flower4[1]) + "x all flower level"
	
	
	if (Game.flower1[5] >= Game.flower1[4]):
		Game.bubble += Game.flower1[1] * Game.upgrade1[1]
		Game.flower1[5] = 0
	
	if (Game.flower2[5] >= Game.flower2[4]):
		Game.bubble += Game.flower2[1] * Game.BPS
		Game.flower2[5] = 0

	if (Game.flower3[5] >= Game.flower3[4]):
		Game.bubble += Game.flower3[1] * (Game.BPS + Game.click)
		Game.flower3[5] = 0

	if (Game.flower4[5] >= Game.flower4[4]):
		Game.bubble += Game.flower4[1] * (Game.flower1[0] + Game.flower2[0] + Game.flower3[0])
		Game.flower4[5] = 0
	
	if (Game.flower1[0] > 0):
		$MarginContainer/VBoxContainer/RoseFlower.visible = true
	else:
		$MarginContainer/VBoxContainer/RoseFlower.visible = false

	if (Game.flower2[0] > 0):
		$MarginContainer/VBoxContainer/TulipFlower.visible = true
	else:
		$MarginContainer/VBoxContainer/TulipFlower.visible = false
		
	if (Game.flower3[0] > 0):
		$MarginContainer/VBoxContainer/OrchidFlower.visible = true
	else:
		$MarginContainer/VBoxContainer/OrchidFlower.visible = false
		


func _on_upgrade_1_pressed():
	upgrade(Game.flower1)
	

func _on_upgrade_2_pressed():
	upgrade(Game.flower2)


func upgrade(UpgradeIndex):
	#var UpgradeIndex = index;
	
	if (Game.bubble >= UpgradeIndex[2]):
		Game.bubble -= UpgradeIndex[2];
		UpgradeIndex[0] += 1
		UpgradeIndex[1] += UpgradeIndex[3]
		UpgradeIndex[2] += UpgradeIndex[2] * 0.25
		
		if (UpgradeIndex[0] == 1 && UpgradeIndex == Game.flower1):
			UpgradeIndex[1] += 10
		
		if (UpgradeIndex[0] == 1 && UpgradeIndex == Game.flower2):
			UpgradeIndex[1] += 25
		
		if (UpgradeIndex[0] == 1 && UpgradeIndex == Game.flower3):
			UpgradeIndex[1] += 50
	


func _on_upgrade_3_pressed():
	upgrade(Game.flower3)


func _on_upgrade_1_button_down():
	$UpgradeLoop.start()
	TimerRun = 0.1
	TimerIndex = Game.flower1


func _on_upgrade_2_button_down():
	$UpgradeLoop.start()
	TimerRun = 0.1
	TimerIndex = Game.flower2


func _on_upgrade_3_button_down():
	$UpgradeLoop.start()
	TimerRun = 0.1
	TimerIndex = Game.flower3


func _on_upgrade_loop_timeout():
	$UpgradeLoop.set_wait_time(TimerRun)
	upgrade(TimerIndex)
	TimerRun -= 0.005


func _on_upgrade_1_button_up():
	TimerRun = 0.1
	$UpgradeLoop.stop()

func _on_upgrade_2_button_up():
	TimerRun = 0.1
	$UpgradeLoop.stop()

func _on_upgrade_3_button_up():
	TimerRun = 0.1
	$UpgradeLoop.stop()



func _on_upgrade_4_button_down():
	$UpgradeLoop.start()
	TimerRun = 0.1
	TimerIndex = Game.flower4


func _on_upgrade_4_button_up():
	TimerRun = 0.1
	$UpgradeLoop.stop()


func _on_upgrade_4_pressed():
	upgrade(Game.flower4)
