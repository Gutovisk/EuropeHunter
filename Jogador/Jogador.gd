extends KinematicBody2D

#Variaveis de movimento:
var direcao   : Vector2     = Vector2()
var movimento : Vector2     = Vector2()
export (int) var velocidade = 100
export (int) var aceleracao = 20

#Variaveis de animacao:
var olhar         : Dictionary = {"x" : ["Esquerda", "Direita"],"y" : ["Cima", "Baixo"]}
var direcao_olhar : String     = "Baixo"
var estado        : String     = "Parado"

func _physics_process(delta):
	#Movimento em quatro direcoes:
	if direcao.x == 0:
		#Se nao estiver se movendo no eixo x:
		direcao.y = int(Input.is_action_pressed("mover_baixo")) - int(Input.is_action_pressed("mover_cima"))
		#O vetor "direcao" recebe o valor no eixo y da variacao do pressionamento de teclas. Se a tecla estiver pressionada recebe o valor um, senao, zero.
		if direcao.y != 0:
			#Se estiver se movendo no eixo y:
			direcao_olhar = olhar["y"][(direcao.y + 1) / 2]
			#A direcao do olhar recebe a direcao de movimento mais um, dividido por dois, referente as direcoes de olhar do dicionario.
	if direcao.y == 0:
		#Se nao estiver se movendo no eixo y:
		direcao.x = int(Input.is_action_pressed("mover_direita")) - int(Input.is_action_pressed("mover_esquerda"))
		#O vetor "direcao" recebe o valor no eixo x da variacao do pressionamento de teclas. Se a tecla estiver pressionada recebe o valor um, senao, zero.
		if direcao.x != 0:
			#Se estiver se movendo no eixo x:
			direcao_olhar = olhar["x"][(direcao.x + 1) / 2]
			#A direcao do olhar recebe a direcao de movimento mais um, dividido por dois, referente as direcoes de olhar do dicionario.
	movimento = movimento.linear_interpolate(direcao * velocidade, aceleracao * delta)
	move_and_slide(movimento)
	#Animacao:
#	if direcao != Vector2():
		#Se direcao for diferente de um vetor vazio:
#		estado = "Andando"
		#A variavel estado e colocada como andando.
#	$Animacao.play(estado + "_" + direcao_olhar)
	#Rodar animacao referente ao estado de movimento e a direcao do olhar (Deixei comentado, porquanto nao tem animacao).
