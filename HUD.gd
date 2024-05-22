extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

var score: int = 0

func game_over():
	$Message.show()
	$RestartButton.show()
	$ScoreTimer.stop()
	$QuitButton.show()

func _on_start_button_button_down():
	$StartButton.hide()
	$Message.hide()
	start_game.emit()
	$ScoreTimer.start()
	$QuitButton.hide()


func _on_restart_button_pressed():
	get_tree().reload_current_scene()


func _on_score_timer_timeout():
	score +=1
	$ScoreLabel.text = str(score)


func _on_quit_button_pressed():
	get_tree().quit()
