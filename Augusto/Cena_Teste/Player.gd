extends Area2D


var speed = 400
var walk = true

func _physics_process(delta):
	if walk == true:
		if Input.is_action_pressed("ui_right"):
			position.x += speed * delta
		if Input.is_action_pressed("ui_left"):
			position.x -= speed * delta
		if Input.is_action_pressed("ui_down"):
			position.y += speed * delta
		if Input.is_action_pressed("ui_up"):
			position.y -= speed * delta


func _on_Player_area_entered(area):
	if area.is_in_group("NPC"):
		get_parent().dialog()
		print("NPC")

