extends RigidBody2D
signal game_over
var speed: int
var angle: float
var game_over_bool: bool
var startPos

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	startPos = position
	speed = randi_range(200, 600)
	angle = randf_range(-0.9,0.9)
	pass

func _process(delta):
	if ((position.x > get_viewport_rect().size.x || position.x < 0) && !game_over_bool):
		game_over_bool = true
		game_over.emit()
		hide()
		linear_velocity = Vector2.ZERO
		position = Vector2.ZERO
# Called every frame. 'delta' is the elapsed time since the previous frame.
func start():
	game_over_bool = false
	show()
	position = startPos
	apply_central_impulse(Vector2(1,angle).normalized() * speed)


func _on_speed_increase_timer_timeout():
	linear_velocity *= 1.01


#func _on_visible_on_screen_notifier_2d_screen_exited():
	#game_over.emit()
	#linear_velocity = Vector2.ZERO
