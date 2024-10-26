extends CanvasLayer

signal start_game


func update_score(value) :
	$Score.text = str(value)
	
	
func show_message(message):
	$Message.text = str(message)
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over!")
	await $MessageTimer.timeout
	$Message.text ="Dodge The Creeps"
	$Message.show()
	await get_tree().create_timer(1.0).timeout
	

	$START.show()
	

func _on_start_pressed() :
	#oyunu başlat sinyalini tetikle
	
	$START.hide()
	start_game.emit()
	
	pass # Replace with function body.


func _on_message_timer_timeout() :
	$Message.hide()
	
	
