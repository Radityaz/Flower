extends Node

var bubble = 100;
var BPS = 0;

#[Level,Buff,Cost,Potential]
var upgrade1 = [1,1,25,1]
var upgrade2 = [0,0,100,2]

#[Level,Buff,Cost,Potential,Range,step]
var flower1 = [0,0,100,0.50,180,0]
var flower2 = [0,0,2000,2,150,0]

# [Daisy,Rose]
var currentselecttheme = 0
var themepath = ["res://img/DaisyLD.png","res://img/RoseLD.png"]



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
	BPS = upgrade2[1]
