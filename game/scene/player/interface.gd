extends CanvasLayer  


func _ready() -> void:
	$MarginContainer/VBoxContainer/BALANCE.text = "Баланс " + str(GlobalValues.wallet)
