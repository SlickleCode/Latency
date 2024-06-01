extends Area2D

export var port_type : int = 0
var color_arr = [Color.red, Color.green, Color.yellow]

signal packet_received(packet_type, packet_time)

func _ready():
	modulate = color_arr[port_type]

func _on_Port_body_entered(body):
	if body.is_in_group("Packets") and body.packet_type == self.port_type:
		emit_signal('packet_received', body.packet_type, body.packet_latency)
		body.destroy()
		$AudioStreamPlayer.play()
