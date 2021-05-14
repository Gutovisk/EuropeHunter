extends Node2D



var dialog = Dialogic.start("Primeira_Cena")

func dialog():
	$Player.walk = false
	$Player/Camera2D.add_child(dialog)


func _ready():
	dialog.connect("dialogic_signal",self,"play")
	dialog.connect('timeline_end', self, 'after_dialog')

func play(anim):
	$AnimationPlayer.play(anim)

func after_dialog(Terceira_Parte):
	print("Continua o show garai")
	$Player.walk = true
