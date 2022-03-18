extends Area2D

export var velocitat : int = 700
var direccio = Vector2.ZERO

func _ready():
	rotation_degrees = 90
	position = Vector2(120, 500)
	
func _process(delta):
	position += direccio * velocitat * delta	
	if Input.is_action_pressed("mou_dreta"):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("mou_esquerra"):
		direccio += Vector2.LEFT
	if Input.is_action_pressed("mou_adalt"):
		direccio += Vector2.UP
	if Input.is_action_pressed("mou_abaix"):
		direccio += Vector2.DOWN
		
	position += direccio.normalized()                                                                  * velocitat * delta
	direccio = Vector2.ZERO	


func _on_Personatges_area_entered(area):
	modulate = Color(1,0,0)
	if area.is_in_group('Inici'):
		print(area.name)
		modulate = Color(1,0,0)
	elif area.is_in_group('Final'):
		modulate = Color(0,1,0)
	$Godot.rotation_degrees += 45

func _on_Personatges_area_exited(area):
	modulate = Color(1,1,1)
