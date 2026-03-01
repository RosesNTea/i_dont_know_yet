extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.mainMenuShow.connect(showMainMenu);
	SignalBus.mainMenuHide.connect(hideMainMenu);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_quit_pressed() -> void:
	get_tree().quit()


func hideMainMenu() -> void:
	visible = false;
	
func showMainMenu() -> void:
	visible = true;
