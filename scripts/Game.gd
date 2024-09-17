extends Node2D

""" MAXIMUM VALUES """

""" 
WAVE DESCRIPTIONS

The waves will come every WAVE_TIMER seconds.
Maximum MAX_MOBS per wave mobs will be spawned.
Total MAX_WAVES waves will be in the game.
"""

"""
POINTS DESCRIPTIONS

MAX_POINTS is the maximum points that user can get.
MAX_RESEARCH_PERCENT is the maximum percentage that user can get.

"""

"""
WILDCARD STRUCTURE

[NAME, DESC, COST, RANGE, REQ_RESEARCH, FUNC]

NAME is the displayed titles.
DESC is the description of the wild card.
COST is the required points to use it.
RANGE is the range of the impact. [Calculation: (pi * RANGE) ^ 2 ]
REQ_RESEARCH is the required research points to use the wild card.
FUNC is the game API (functions) that will be called when user uses it.
"""

# TOWERS
var MAX_CORE_HEALTH = 10000

# WAVES
var MAX_MOBS = 100
var MAX_WAVES = 16
var WAVE_TIMER = 60

# POINTS
var MAX_POINTS = 5000
var MAX_RESEARCH_POINTS = 100
var MAX_MANPOWER = 100

var WILD_CARDS = [
	[
		"Task Force",
		"Spawn deadly trained task force near to the core.", 
		100,
		30,
		5,
		"FUNC_HERE"
	],
	[
		"Artillery",
		"Launch 8 bullets of 40mm to the requested area.",
		300,
		50,
		10,
		"FUNC_HERE"
	],
	[
		"Airstriker",
		"",
		400,
		100,
		30,
		"FUNC_HERE"
	],
	[
		"Core Overcharger",
		"",
		800,
		0,
		80,
		"FUNC_HERE"
	],
	[
		"Nuclear Missile",
		"",
		5000,
		1000000,
		100,
		"FUNC_HERE"
	]
]

var points = 25
var wave = 0
var mobsLeft = 0
var waveMobs = [5,6,10,20,40,0]
var waveSpeed = [1,1,0,5,0.5,0.3,100]
