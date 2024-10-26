class_name Player extends CharacterBody2D


signal hit




var speed : int = 400
var screen_size : Vector2 = Vector2.ZERO

var direction : Vector2=Vector2.ZERO


func _ready() :
	screen_size = get_viewport_rect().size

func _process(_delta):
	
	velocity=Vector2.ZERO
	
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	#print(direction)
	
	velocity = speed * direction
	
	if velocity.length() > 0:
		
		if velocity.x !=0:
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_v = false    #flip_v dikey yönlü flip_h yatay yönlü yön değiştirme
			$AnimatedSprite2D.flip_h = velocity.x <0  #  saga x ekseni pozitif sola x ekseni negatif
			
		if velocity.y !=0:
				$AnimatedSprite2D.play("up")
				$AnimatedSprite2D.flip_h = false
				$AnimatedSprite2D.flip_v = velocity.y >0 # yukarı y ekseni negatif asagı y ekseni pozitif anlamına gelir
				
				
	else: 
		$AnimatedSprite2D.stop()
	
	position =position.clamp(Vector2.ZERO,screen_size)
			

	move_and_slide()
	
	

	
	
	
func die():
	queue_free()	
	
	
	
	
	
	
