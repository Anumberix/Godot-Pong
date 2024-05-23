extends RigidBody2D

@export var speed: float
var game_running: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var verticalInput = Input.get_axis("up", "down")
	
	if (game_running):
		move_local_y(verticalInput * delta * speed)

	if (position.y > 600):
		position.y = 600
	if (position.y < 50):
		position.y = 50


func _on_ball_game_over():
	game_running = false


func _on_hud_start_game():
	game_running = true
