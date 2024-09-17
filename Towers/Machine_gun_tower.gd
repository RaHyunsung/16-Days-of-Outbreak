extends StaticBody2D

var Bullet = preload("res://Towers/7_62_bullet.tscn")
var BulletDamage = 5
var pathName
var currentTargets = []
var curr

func _on_tower_body_entered(body: Node2D) -> void:
	if "Infantry" in body.name:
		var tempArray = []
		currentTargets = get_node("Tower").get_overlapping_bodies()
		
		for i in currentTargets:
			if "Infantry" in i.name:
				tempArray.append(i)
			
		var currentTarget = null
		
		for i in tempArray:
			if currentTarget == null:
				currentTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currentTarget.get_prgress():
					currentTarget = i.get_node("../")
		curr = currentTarget
		pathName = currentTarget.get_parent().name
		
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.BulletDamage = BulletDamage
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position

func _on_tower_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
	
