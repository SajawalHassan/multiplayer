extends Node2D

func _ready() -> void:
	get_tree().connect("network_peer_connected", self, "_player_connected")

func _on_Button_pressed() -> void:
	var net = NetworkedMultiplayerENet.new()
	net.create_server(6969, 2)
	get_tree().set_network_peer(net)
	print("hosting")


func _on_Button2_pressed() -> void:
	var net = NetworkedMultiplayerENet.new()
	net.create_client("127.0.0.1", 6969)
	get_tree().set_network_peer(net)

func _player_connected(id):
	Global.player2id = id
	var game = preload("res://Game.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()
