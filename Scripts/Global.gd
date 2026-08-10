extends Node

var player_health = 100
var enemy_health = 200

var attacking = false
var attacking_done = false
var which_question: int
var how_many_answ: int
var stage = 1
var question_number
var slow_true = false
# Shooting game
var question_index_1 = [0, 1, 2]
var shot_yet = false
var shot_correct = false
var flash = false
#attacking game
var what_available = []
var number_of_times = 1
