extends RigidBody2D

var enemy_types : Array = []
var animation_name : String =""

 


func _ready() -> void:
	
	enemy_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	
	#print(enemy_types)
	
	animation_name = enemy_types[randi()%enemy_types.size()]
	
	#print(animation_name)
	$AnimatedSprite2D.play(animation_name)
	
	



func _process(_delta) :
	#enemy hareketleri burda yapılacak
	
	pass


func _on_visible_on_screen_enabler_2d_screen_exited() :
	die()
	
func die():
	
	queue_free()
		


func _on_body_entered(body) :
	if body is Player :
		body.hit.emit()
		
	
