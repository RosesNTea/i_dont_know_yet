extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "crawling";


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	if ($AnimatedSprite2D.animation == "crawling"):
		$ColorRect.color = Color(42.356, 42.356, 42.356, 1.0)
		$AnimatedSprite2D.animation = "crustacianControl";
		$AnimatedSprite2D.play();
