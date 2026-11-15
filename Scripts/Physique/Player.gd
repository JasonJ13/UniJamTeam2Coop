extends CharacterBody2D
class_name Player


const SPEED = 20000.0

var button : PhysiqueButton = null

var interacting := false
@onready var animationManager : AnimationManager = $Body
@onready var stepsSound : AudioStreamPlayer2D = $stepsSound
@onready var timer : Timer = $stepsSound/stepSoundDelay

func _ready() -> void:
	ChangeVisibillity()
	ChangeVisibillity(false)

func _physics_process(delta: float) -> void:


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	if direction && !interacting:
		velocity = direction.normalized() * SPEED * delta
		animationManager.walking()
	else :
		velocity = Vector2.ZERO
		
		if !interacting :
			animationManager.stop()

	if (Input.is_action_just_pressed("Interact") && button != null && !interacting) :
		button.press() 
		interacting = true
		animationManager.interact()

	move_and_slide()
	
func _on_zone_detection_body_entered(body : Node2D):
	if body is PhysiqueButton:
		button = body

	
func _on_zone_detection_body_exited (body : Node2D):
	if body == button:
		button = null


func StopInteract() -> void:
	interacting = false


func _process(_delta: float) -> void:
	if Input.get_vector("Left", "Right", "Up", "Down") != Vector2.ZERO :
		if timer.is_stopped():
			timer.start(0.5)
	else:
		timer.stop()


func _on_step_sound_delay_timeout() -> void:
	stepsSound.play()


var visi : int = 0

func ChangeVisibillity(add : bool = true) :
	if add :
		visi +=1
		if visi == 0 :
			z_index = 6
	else :
		visi -= 1
		if visi < 1 :
			z_index = 0
		
