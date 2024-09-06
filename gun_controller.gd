extends Node

@export var StartingWeapon: PackedScene
var hand : Node3D
var equiped_weapon : Node3D
# Called when the node enters the scene tree for the first time.
func _ready():
	hand = $"../Body/hand"
	if StartingWeapon:
		equipweapon(StartingWeapon.instantiate())
		
func equipweapon(weapon_to_equip):
	if equiped_weapon:
		print("deleting current weapon")
		equiped_weapon.queuefree()
	else:
		print("no weapon equipped")
		equiped_weapon = weapon_to_equip
		hand.add_child(equiped_weapon)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func shoot():
	print("Shoot")
	if equiped_weapon:
		equiped_weapon.shoot()
