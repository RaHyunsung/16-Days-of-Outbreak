extends CharacterBody2D

@export var speed = 100
var Health = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var targetNode = get_tree().get_root().get_node("Game/targetNode").global_position
	get_parent().set_progress(speed * delta + get_parent().get_progress())
	look_at(targetNode)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
		
	if Health <= 0:
		get_parent().get_parent().queue_free()
