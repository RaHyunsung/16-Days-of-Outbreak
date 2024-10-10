extends Panel

@onready var tower = preload("res://machine_gun_tower.tscn")
var currTile  # Currently selected tile (can be used for grid placement)
var tempTower = null  # Holds the temporary tower while placing
var is_dragging = false  # To track if the player is dragging the tower

# Grid snapping (optional)
var grid_size = 32

func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		# Left click down
		if event.button_index == MOUSE_BUTTON_LEFT and tempTower == null:
			# Instantiate tower if none exists and left-click pressed
			tempTower = tower.instantiate()
			add_child(tempTower)
			tempTower.global_position = event.global_position  # Set initial position
			tempTower.process_mode = Node.PROCESS_MODE_DISABLED  # Disable tower processing while dragging

		elif event.button_index == MOUSE_BUTTON_LEFT and tempTower != null:
			# Start dragging the tower
			is_dragging = true

	elif event is InputEventMouseMotion and is_dragging and tempTower != null:
		# Update tower's position during drag
		tempTower.global_position = snap_to_grid(event.global_position)

	elif event is InputEventMouseButton and not event.pressed:
		# Left click released
		if event.button_index == MOUSE_BUTTON_LEFT and tempTower != null and is_dragging:
			is_dragging = false
			place_tower()

		elif event.button_index == MOUSE_BUTTON_LEFT and tempTower == null:
			print("Error: No tower to place or drag.")
			is_dragging = false

# Snap tower to the grid if needed
func snap_to_grid(position):
	return Vector2(
		floor(position.x / grid_size) * grid_size,
		floor(position.y / grid_size) * grid_size
	)

# Handle final placement of the tower
func place_tower():
	if tempTower != null:
		# Snap the tower to the grid or finalize its placement
		tempTower.global_position = snap_to_grid(tempTower.global_position)
		tempTower.process_mode = Node.PROCESS_MODE_INHERIT  # Enable processing if necessary
		print("Tower placed at: ", tempTower.global_position)
		tempTower = null  # Reset for the next tower placement
	else:
		print("No tower to place.")
