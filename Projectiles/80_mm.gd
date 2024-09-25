extends CharacterBody2D

var target
var Speed = 1500
var pathName = ""
var BulletDamage

func _physics_process(delta: float):
	if is_instance_valid(target) == false:
		var pathSpanwerNode = get_tree().get_root().get_node("Game/PathSpawner")
	
		for i in pathSpanwerNode.get_child_count():
			if pathSpanwerNode.get_child(int(i)).name == pathName:
				target = pathSpanwerNode.get_child(i).get_child(0).get_child(0).global_position
			
		velocity = global_position.direction_to(target) *Speed
	
		look_at(target)
	
		move_and_slide()
		
	else:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	for obj in GameSettings.MOBS:
		print(body.name, obj)
		if body.name == obj:
			body.Health -= BulletDamage
			queue_free()
