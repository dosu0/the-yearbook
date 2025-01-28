extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 75.0

var face_direction := "front"
var animation_to_play := "front_idle"

func _physics_process(_delta: float) -> void:
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = input_direction * SPEED
	
	# Since we're using 360 degree movement now, we can't assume assume vertical motion should always take priority. So we figure out the biggest direction.
	if input_direction.length() > 0: # Check if we're moving
		if abs(input_direction.x) > abs(input_direction.y): # Horizontal or vertical? (prioritizing vertical movement)
			face_direction = "left" if input_direction.x < 0 else "right"
		else:
			face_direction = "front" if input_direction.y < 0 else "back"
	
	animation_to_play = ("walk" if velocity.length() > 0.0 else "idle") + "_" + face_direction
	sprite.play(animation_to_play)
	
	# Move character, slide at collision
	move_and_slide()
