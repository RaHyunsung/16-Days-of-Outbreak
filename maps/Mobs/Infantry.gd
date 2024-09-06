extends CharacterBody2D

@export var speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().set_progress(speed * delta + get_parent().get_progress())
