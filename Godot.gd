extends Sprite

export var velocitat : int = 300
var direccio = Vector2(0, 0) 

func _ready():
	rotation_degrees = 90
	position = Vector2(120, 500)
	
func _process(delta):
	position += direccio * velocitat * delta
		
	if Input.is_action_pressed("mou_dreta"):
		direccio = Vector2(1, 0)
