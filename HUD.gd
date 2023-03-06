extends CanvasLayer

signal start_game

func update_score(score):
	$scoreLabel.text = str(score)

func show_message(text):
	$messageLabel.text = text
	$messageLabel.show()
	$messageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($messageTimer, "timeout")
	$messageLabel.text = "Dodge The Creeps"
	$messageLabel.show()
	yield(get_tree().create_timer(1.0), "timeout")
	

func _on_Button_pressed():
	$Button.hide()
	#$messageLabel.hide()
	emit_signal("start_game")


func _on_messageTimer_timeout():
	$messageLabel.hide()
