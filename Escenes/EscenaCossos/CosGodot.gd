extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 1200
var salt = Vector2.UP * 400

func _physics_process(delta):
	velocitat.x = 0
	if Input.is_action_pressed("mou_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou_esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou_adalt") and is_on_floor():
		velocitat += salt
#	if Input.is_action_just_pressed("mou_abaix"):
#		velocitat += Vector2.DOWN * velocitat_base

	velocitat += gravetat * delta
	velocitat = move_and_slide((velocitat), Vector2.UP)
	
	anima(velocitat)
	
func anima(velocitat: Vector2):
	var animacio = $Sprite
	if velocitat.x > 0:
		animacio.flip_h  = false
		animacio.play("camina")
	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play("camina")
	
	if velocitat.y < -1:
		animacio.play("salta")
	elif abs(velocitat.x) < 0.1:
		animacio.play("default")
			

func _on_Final_body_entered(body):
	get_tree().change_scene("res://Escenes/EscenaCossos/Escena2.tscn")


func _on_Limit_body_entered(body):
	position = Vector2(25, 425)


func _on_IniciEscena2_body_entered(body):
	get_tree().change_scene("res://Escenes/EscenaCossos/EscenaCossos.tscn")
