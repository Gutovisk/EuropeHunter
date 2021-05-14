extends Area2D

export(String,"DOOR","ITEM","NPC") var type
export var pathto = ""

export(String, "CHAVE","CHAVE2") var item = "CHAVE"
onready var body = get_parent().get_parent().get_node("Jogador")

func _physics_process(delta):
	if(overlaps_body(body)):
		if Input.is_action_just_pressed("interact"):
			if type == "DOOR":
				get_tree().change_scene(pathto)
			if type == "ITEM":
				Global.Progresso.Inventario.push_back(item)
				print(Global.Progresso.Inventario)
				queue_free()
