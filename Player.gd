extends RigidBody2D

@export var speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var verticalInput = Input.get_axis("up", "down")
	#move_and_collide(Vector2(0, verticalInput * speed))
	move_local_y(verticalInput * delta * speed)
