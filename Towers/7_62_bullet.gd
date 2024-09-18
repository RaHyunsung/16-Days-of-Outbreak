extends CharacterBody2D

var target
var Speed = 1000
var pathName = ""
var BulletDamage
var pathSpanwerNode

func _ready() -> void:
	pathSpanwerNode = get_tree().get_root().get_node("Main/PathSpawner")

func _physics_process(delta: float):
	#var pathSpanwerNode = get_tree().get_root().get_node("Main/PathSpawner")
	await get_tree().create_timer(0.5).timeout
	
	for i in pathSpanwerNode.get_child_count():
		if pathSpanwerNode.get_child(i).name == pathName:
			target = pathSpanwerNode.get_child(i).get_child(0).get_child(0).global_position
			
	velocity = global_position.direction_to(target) *Speed
	
	look_at(target)
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if "Infantry" in body.name:
		queue_free()
