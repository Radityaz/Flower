extends ScrollContainer

@onready var GoodWater = $MarginContainer/VBoxContainer/GoodQualityWater
@onready var GoodWaterButton = $MarginContainer/VBoxContainer/GoodQualityWater/MarginContainer/HBoxContainer/MarginContainer2/Upgrade1Cost
@onready var GoodWaterLabel = $MarginContainer/VBoxContainer/GoodQualityWater/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var GoodWaterBuff = $MarginContainer/VBoxContainer/GoodQualityWater/MarginContainer/HBoxContainer/VBoxContainer/Upgrade1Buff
@onready var GoodWaterCost = $MarginContainer/VBoxContainer/GoodQualityWater/MarginContainer/HBoxContainer/MarginContainer2/Upgrade1Cost/HBoxContainer/Upgrade1Label

@onready var BetterSpotLight = $MarginContainer/VBoxContainer/BetterSpotLight
@onready var BetterSpotLightButton = $MarginContainer/VBoxContainer/BetterSpotLight/MarginContainer/HBoxContainer/MarginContainer2/Upgrade2Cost
@onready var BetterSpotLightLabel = $MarginContainer/VBoxContainer/BetterSpotLight/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var BetterSpotLightBuff = $MarginContainer/VBoxContainer/BetterSpotLight/MarginContainer/HBoxContainer/VBoxContainer/Upgrade2Buff
@onready var BetterSpotlightCost = $MarginContainer/VBoxContainer/BetterSpotLight/MarginContainer/HBoxContainer/MarginContainer2/Upgrade2Cost/HBoxContainer/Upgrade2Label

@onready var SuperFertilizer = $MarginContainer/VBoxContainer/SuperFertilizer
@onready var SuperFertilizerButton = $MarginContainer/VBoxContainer/SuperFertilizer/MarginContainer/HBoxContainer/MarginContainer2/Upgrade3Cost
@onready var SuperFertilizerLabel = $MarginContainer/VBoxContainer/SuperFertilizer/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var SuperFertilizerBuff = $MarginContainer/VBoxContainer/SuperFertilizer/MarginContainer/HBoxContainer/VBoxContainer/Upgrade3Buff
@onready var SuperFertilizerCost = $MarginContainer/VBoxContainer/SuperFertilizer/MarginContainer/HBoxContainer/MarginContainer2/Upgrade3Cost/HBoxContainer/Upgrade3Label

@onready var TimerIndex;
@onready var TimerRun;

@onready var UpgradeNotReady = load("res://theme/PrimaryTheme.tres")
@onready var UpgradeReady = load("res://theme/SecondaryTheme.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if (Game.flower1[0] > 0):
		GoodWater.visible = true
		BetterSpotLight.visible = true
		SuperFertilizer.visible = true

		
	else:
		GoodWater.visible = false
		BetterSpotLight.visible = false
		SuperFertilizer.visible = false


	GoodWaterLabel.text = "Fresh Water Lv " + str(Game.upgrade1[0])
	BetterSpotLightLabel.text = "Better Spotlight Lv " + str(Game.upgrade2[0])
	SuperFertilizerLabel.text = "Super Fertilizer Lv " + str(Game.upgrade3[0])


		
	
	GoodWaterBuff.text = str(Game.upgrade1[1]) + " Bubble per tap"
	GoodWaterCost.text = str(Game.convertnumber(floor(Game.upgrade1[2])))

	BetterSpotLightBuff.text = str(Game.upgrade2[1]) + " Bubble per second"
	BetterSpotlightCost.text = str(Game.convertnumber(floor(Game.upgrade2[2])))

	SuperFertilizerBuff.text = str(Game.upgrade3[1]) + "% Boost Flower Production"
	SuperFertilizerCost.text = str(Game.convertnumber(floor(Game.upgrade3[2])))
	
	if (Game.bubble >= Game.upgrade1[2]):
		GoodWaterBuff.text = str(Game.upgrade1[1]) + " > " + str(Game.upgrade1[1] + Game.upgrade1[3] ) + " Bubble per tap" 
		GoodWaterButton.theme = UpgradeReady 
	else:
		GoodWaterButton.theme = UpgradeNotReady 

		
	if (Game.bubble >= Game.upgrade2[2]):
		BetterSpotLightBuff.text = str(Game.upgrade2[1]) + " > " + str(Game.upgrade2[1] + Game.upgrade2[3] ) + " Bubble per second" 
		BetterSpotLightButton.theme = UpgradeReady 
	else:
		BetterSpotLightButton.theme = UpgradeNotReady 

	if (Game.bubble >= Game.upgrade3[2]):
		SuperFertilizerBuff.text = str(Game.upgrade3[1]) + " > " + str((Game.upgrade3[1] + Game.upgrade2[3]) ) + "% Boost Flower Production" 
		SuperFertilizerButton.theme = UpgradeReady 
	else:
		SuperFertilizerButton.theme = UpgradeNotReady 

func _on_upgrade_1_cost_pressed():
	upgrade(Game.upgrade1);

func _on_upgrade_2_cost_pressed():
	upgrade(Game.upgrade2);

func _on_upgrade_3_cost_pressed():
	upgrade(Game.upgrade3);

func upgrade(UpgradeIndex):
	#var UpgradeIndex = index;
	
	if (Game.bubble >= UpgradeIndex[2]):
		Game.bubble -= UpgradeIndex[2];
		UpgradeIndex[0] += 1
		UpgradeIndex[1] += UpgradeIndex[3]
		UpgradeIndex[2] += UpgradeIndex[2] * 0.10
		


func _on_upgrade_1_cost_button_down():
	$UpgradeLoop.start()
	TimerRun = 0.1
	TimerIndex = Game.upgrade1



func _on_upgrade_2_cost_button_down():
	$UpgradeLoop.start()
	TimerRun = 0.1
	TimerIndex = Game.upgrade2

func _on_upgrade_3_cost_button_down():
	$UpgradeLoop.start()
	TimerRun = 0.1
	TimerIndex = Game.upgrade3


func _on_upgrade_loop_timeout():
	$UpgradeLoop.set_wait_time(TimerRun)
	upgrade(TimerIndex)
	TimerRun -= 0.005


func _on_upgrade_1_cost_button_up():
	TimerRun = 0.1
	$UpgradeLoop.stop()

func _on_upgrade_2_cost_button_up():
	TimerRun = 0.1
	$UpgradeLoop.stop()

func _on_upgrade_3_cost_button_up():
	TimerRun = 0.1
	$UpgradeLoop.stop()



