extends Node

var enemy_scenes : PackedScene = load("res://scanes/enemy/enemy.tscn")

var player_scene: PackedScene = load("res://scanes/player/player.tscn")


var score : int = 0 


func _ready():
	
	pass

func new_game():
	
	var player=player_scene.instantiate()
	player.hit.connect(_on_player_hit)
	
	player.position = $PlayerSpawnPosition.position
	add_child(player)
	
	
	$Music.play()
	
	score = 0
	
	$Player.position = $PlayerSpawnPosition.position
	$Timers/EnemyTimer.start()
	$Timers/ScoreTimer.start()
	
	
	
	
		
	
	
func _on_enemy_timer_timeout() :
	# sürekli enemy oluşturur
	
	var enemy = enemy_scenes.instantiate()
	var enemy_spawn_position =$Path2D/PathFollow2D
	
	enemy_spawn_position.progress_ratio = randf()
	
	var direction  = enemy_spawn_position.rotation + PI/2
	enemy.position = enemy_spawn_position.position
	direction +=randf_range(-PI/4 , PI/4)
	enemy.rotation = direction
	
	var velocity  = Vector2(randf_range(150.0,250.0),0.0)
	enemy.linear_velocity = velocity.rotated(direction)
	
	$EnemeyContainer.add_child(enemy)
	
	
	
	
	
	pass # Replace with function body.

func _on_start_timer_timeout():
	#oyunu başlat
	pass # Replace with function body.


func _on_score_timer_timeout() :
	# score değerini arttırır
	
	score += 1
	$HUD.update_score(score)
	
	pass # Replace with function body.


func _on_hud_start_game() :
	new_game()
	$HUD.update_score(0)
	$HUD.show_message(" OYUN BAŞLIYOR! ")
	
	
	
	
	
	


func _on_player_hit() :
	
	$Player.die()
	
	
	
	$HUD.show_game_over()
	$Timers/EnemyTimer.stop()
	
	$Timers/ScoreTimer.stop()
	
	$Music.stop()
	$"Game over sound".play()
	
	
	get_tree().call_group("Enemy","queue_free")
	
	
	
	
	
	
	
	
