extends Node

var bubble = 1000000000;
var BPS = 0;
var click = 0;

var UpgradeStep = [10, 25, 50, 100, 150, 300, 400, 800]

#[Level,Buff,Cost,Potential,UpgradeStep,MultipliyerPotential]
var upgrade1 = [1,1,25,1,0,1]
var upgrade2 = [0,0,100,1,0,1]
var upgrade3 = [0,1,2500,1,0,1]

#[Level,Buff,Cost,Potential,Range,step,UpgradeStep,MultipliyerPotential]
var flower1 = [0,0,100,1,180,0,0,1]
var flower2 = [0,0,2000,5,240,0,0,1]
var flower3 = [0,0,15000,10,300,0,0,1]
var flower4 = [0,0,100000,50,360,0,0,1]



# [Daisy,Rose]
var currentselecttheme = 0
var themepath = ["res://img/DaisyLD.png",
				"res://img/RoseLD.png",
				"res://img/TulipLD.png",
				"res://img/OrchidLD.png"]



func changetheme(index):
	currentselecttheme = index;

func convertnumber(number):
	var result = number
	
	if result >= 1000000:
		return ("%.1f b" % (result/1000000.0))
	elif result >= 1000 :
		return ("%.1f a" % (result/1000.0))
	else:
		return result

func _process(_delta):
	BPS = upgrade2[1] * upgrade2[5]
	click = upgrade1[1] * upgrade1[5]
