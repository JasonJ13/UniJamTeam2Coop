extends CharacterBody2D
class_name Player


const SPEED = 20000.0

var button : PhysiqueButton = null

var interacting := false
@onready var animationManager : AnimationManager = $Body
@onready var stepsSound : AudioStreamPlayer2D = $stepsSound
@onready var timer : Timer = $stepsSound/stepSoundDelay

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
	if Input.is_physical_key_pressed(KEY_RIGHT) || Input.is_physical_key_pressed(KEY_LEFT) || Input.is_physical_key_pressed(KEY_UP) || Input.is_physical_key_pressed(KEY_DOWN) || Input.is_physical_key_pressed(KEY_D) || Input.is_physical_key_pressed(KEY_Q) || Input.is_physical_key_pressed(KEY_Z) || Input.is_physical_key_pressed(KEY_S):
		if timer.is_stopped():
			timer.start(0.5)
	else:
		timer.stop()


func _on_step_sound_delay_timeout() -> void:
	stepsSound.play()
