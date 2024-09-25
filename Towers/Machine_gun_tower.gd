extends StaticBody2D

var Bullet = preload("res://Projectiles/80mm.tscn")
var BulletDamage = 60
var pathName
var currentTargets = []
var curr

func _process(delta):
	if is_instance_valid(curr):
		self.look_at(curr.global_position)

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
				if i.get_parent().progress > currentTarget.progress:
					currentTarget = i.get_node("../")
		curr = currentTarget
		pathName = currentTarget.get_parent().name
		
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.BulletDamage = BulletDamage
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position

func _on_tower_body_exited(body: Node2D) -> void:
	currentTargets = get_node("Tower").get_overlapping_bodies()
	
