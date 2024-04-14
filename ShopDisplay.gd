extends ScrollContainer

@onready var GoodWater = $MarginContainer/VBoxContainer/GoodQualityWater
@onready var GoodWaterLabel = $MarginContainer/VBoxContainer/GoodQualityWater/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var GoodWaterBuff = $MarginContainer/VBoxContainer/GoodQualityWater/MarginContainer/HBoxContainer/VBoxContainer/Upgrade1Buff
@onready var GoodWaterCost = $MarginContainer/VBoxContainer/GoodQualityWater/MarginContainer/HBoxContainer/MarginContainer2/Upgrade1Cost/HBoxContainer/Upgrade1Label

@onready var BetterSpotLight = $MarginContainer/VBoxContainer/BetterSpotLight
@onready var BetterSpotLightLabel = $MarginContainer/VBoxContainer/BetterSpotLight/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var BetterSpotLightBuff = $MarginContainer/VBoxContainer/BetterSpotLight/MarginContainer/HBoxContainer/VBoxContainer/Upgrade2Buff
@onready var BetterSpotlightCost = $MarginContainer/VBoxContainer/BetterSpotLight/MarginContainer/HBoxContainer/MarginContainer2/Upgrade2Cost/HBoxContainer/Upgrade2Label

@onready var TimerIndex;
@onready var TimerRun;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if (Game.flower1[0] > 0):
		GoodWater.visible = true
		BetterSpotLight.visible = true
		
	else:
		GoodWater.visible = false
		BetterSpotLight.visible = false

	GoodWaterLabel.text = "Fresh Water Lv " + str(Game.upgrade1[0])
	BetterSpotLightLabel.text = "Better Spotlight Lv " + str(Game.upgrade2[0])

		
	
	GoodWaterBuff.text = str(Game.upgrade1[1]) + " Bubble per tap"
	GoodWaterCost.text = str(Game.convertnumber(floor(Game.upgrade1[2])))
	BetterSpotLightBuff.text = str(Game.upgrade2[1]) + " Bubble per second"
	BetterSpotlightCost.text = str(Game.convertnumber(floor(Game.upgrade2[2])))
	
	if (Game.bubble >= Game.upgrade1[2]):
		GoodWaterBuff.text = str(Game.upgrade1[1]) + " > " + str(Game.upgrade1[1] + Game.upgrade1[3] ) + " Bubble per tap" 
		
	if (Game.bubble >= Game.upgrade2[2]):
		BetterSpotLightBuff.text = str(Game.upgrade2[1]) + " > " + str(Game.upgrade2[1] + Game.upgrade2[3] ) + " Bubble per second" 

func _on_upgrade_1_cost_pressed():
	upgrade(Game.upgrade1);

func _on_upgrade_2_cost_pressed():
	upgrade(Game.upgrade2);

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



