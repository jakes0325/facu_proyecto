extends Node

@onready var player:CharacterBody2D = $Player 



func _ready():
	if GameManager.player:
		
