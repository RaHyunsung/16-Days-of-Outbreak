extends Node2D

# Base's maximum health
export var max_health: int = 100
var current_health: int = 100

func _ready():
	current_health = max_health

# Method to reduce base's health when attacked
func take_damage(damage: int):
	current_health -= damage
	if current_health <= 0:
		on_base_destroyed()

# Optional: Method for destroying the base
func on_base_destroyed():
	queue_free()  # Or trigger a game over screen
	print("Base has been destroyed!")
