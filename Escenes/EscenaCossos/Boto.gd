extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StaticBody2D_body_entered(body):
	var animacio_switch = $Switch
	animacio_switch.play("presionat")
	

func _on_StaticBody2D_body_exited(body):
	var animacio_switch = $Switch
	animacio_switch.play("default")




func _on_Plataforma2_body_entered(body):
	position = Vector2(270,340)
