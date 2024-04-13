extends ScrollContainer

@onready var FlowerBuff1 = $MarginContainer/VBoxContainer/DaisyFlower/MarginContainer/HBoxContainer/VBoxContainer/FlowerBuff1
@onready var FlowerCost1 = $MarginContainer/VBoxContainer/DaisyFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade1/HBoxContainer/FlowerLabel1
@onready var FlowerStep1 = $MarginContainer/VBoxContainer/DaisyFlower/FlowerGenerate1

@onready var FlowerBuff2 = $MarginContainer/VBoxContainer/RoseFlower/MarginContainer/HBoxContainer/VBoxContainer/FlowerBuff2
@onready var FlowerCost2 = $MarginContainer/VBoxContainer/RoseFlower/MarginContainer/HBoxContainer/MarginContainer2/Upgrade2/HBoxContainer/FlowerLabel2
@onready var FlowerStep2 = $MarginContainer/VBoxContainer/RoseFlower/FlowerGenerate2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	
	FlowerCost1.text = str(Game.convert(floor(Game.flower1[2])))
	FlowerCost2.text = str(Game.convert(floor(Game.flower2[2])))
	
	FlowerStep1.value = Game.flower1[5]
	FlowerStep2.value = Game.flower2[5]
	
	FlowerStep1.max_value = Game.flower1[4]
	FlowerStep2.max_value = Game.flower2[4]
	
	
	if (Game.bubble > Game.flower1[2]):
		FlowerBuff1.text = str(Game.flower1[1]) + " > " + str(Game.flower1[1] + Game.flower1[3]) + " x Bubble per click" 
	else:
		FlowerBuff1.text = str(Game.flower1[1]) + "x Bubble per click"
		
	if (Game.bubble > Game.flower2[2]):
		FlowerBuff2.text = str(Game.flower2[1]) + " > " + str(Game.flower2[1] + Game.flower2[3]) + " x Bubble per second" 
	else:
		FlowerBuff2.text = str(Game.flower2[1]) + "x Bubble per second"
	
	if (Game.flower1[0] > 0):
		Game.flower1[5] += 1
	
	if (Game.flower2[0] > 0):
		Game.flower2[5] += 1
	
	
	if (Game.flower1[5] >= Game.flower1[4]):
		Game.bubble += Game.flower1[1] * Game.upgrade1[1]
		Game.flower1[5] = 0
	
	if (Game.flower2[5] >= Game.flower2[4]):
		Game.bubble += Game.flower2[1] * Game.BPS
		Game.flower2[5] = 0
	
	if (Game.flower1[0] > 0):
		$MarginContainer/VBoxContainer/RoseFlower.visible = true
	else:
		$MarginContainer/VBoxContainer/RoseFlower.visible = false
		


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
	



