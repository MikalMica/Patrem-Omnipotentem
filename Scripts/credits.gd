extends RichTextLabel
@export var array = [];
@export var timeForLine: float;
@export var linesToScroll : int;
@export var scrollAmount: int;
@export var timeForEnd : float;
var currentTime: float;
var currLine = 0;

func _process(delta: float) -> void:
	currentTime += delta;
	if (currLine < array.size() && currentTime >= timeForLine):
		text += "\n";
		text += array[currLine]
		if currLine > linesToScroll:
			position.y -= scrollAmount;
		if !(array[currLine] == ""):
			currentTime = 0;
		currLine+=1;
	elif currLine >= array.size() && currentTime >= timeForEnd:
		currentTime = 0;
		SceneManager.change_scene("res://Scenes/Scenarios/main_menu_scene.tscn");
