extends AudioStreamPlayer

enum BGM_TYPE {
	MAIN = 0,
	MATERI = 1,
	KUIS = 2,
	PHBGAME = 3,
	RGAME = 4,
	SGAME = 5
}

const main_bgm = preload("res://assets/sounds/main-bgm.mp3")
const materi_bgm = preload("res://assets/sounds/materi-bgm.mp3")
const kuis_bgm = preload("res://assets/sounds/kuis-bgm.mp3")
const perilaku_hidup_bersih_game_bgm = preload("res://assets/sounds/perilaku-hidup-bersih-bgm.mp3")
const rambu_game_bgm = preload("res://assets/sounds/rambu-game-bgm.mp3")
const simulasi_game_bgm = preload("res://assets/sounds/simulasi-game-bgm.mp3")

const correct_sfx = preload("res://assets/sounds/sfx/correct-2.mp3")
const click_sfx = preload("res://assets/sounds/sfx/click.wav")
const fail_sfx = preload("res://assets/sounds/sfx/fail.wav")
const pick_sfx = preload("res://assets/sounds/sfx/pick.mp3")
const success_sfx = preload("res://assets/sounds/sfx/success.mp3")
const times_out_sfx = preload("res://assets/sounds/sfx/times-out.mp3")
const wrong_sfx = preload("res://assets/sounds/sfx/wrong.wav")
const next_kuis_sfx = preload("res://assets/sounds/sfx/next-kuis.mp3")


# Fade parameters
const FADE_OUT_DURATION = 1
const FADE_IN_DURATION = 1
const LOW_DB_THRESHOLD = -50.0

var _current_tween: Tween = null

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return

	# Cancel any existing tween
	if _current_tween:
		_current_tween.kill()

	# Create a new tween for fade effects
	_current_tween = create_tween()

	if playing:
		# Fade out current music
		_current_tween.tween_property(self, "volume_db", LOW_DB_THRESHOLD, FADE_OUT_DURATION)
		await _current_tween.finished

		# Change the stream and reset tween
		stream = music
		_current_tween = create_tween()

		# Start playing at minimum volume
		volume_db = LOW_DB_THRESHOLD
		play()

		# Fade in to target volume
		_current_tween.tween_property(self, "volume_db", volume, FADE_IN_DURATION)
	else:
		# No music playing, just set and play
		stream = music
		volume_db = LOW_DB_THRESHOLD
		play()

		# Fade in from silent
		_current_tween.tween_property(self, "volume_db", volume, FADE_IN_DURATION)

func play_bgm(type: BGM_TYPE, volume = 0.0):
	match type:
		BGM_TYPE.MAIN:
			_play_music(main_bgm, volume)
		BGM_TYPE.MATERI:
			_play_music(materi_bgm, volume)
		BGM_TYPE.KUIS:
			_play_music(kuis_bgm, volume)
		BGM_TYPE.PHBGAME:
			_play_music(perilaku_hidup_bersih_game_bgm, volume)
		BGM_TYPE.RGAME:
			_play_music(rambu_game_bgm, volume)
		BGM_TYPE.SGAME:
			_play_music(simulasi_game_bgm, volume)

func play_sfx(sound: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.bus = "SFX"
	fx_player.stream = sound
	fx_player.name = "SFX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()

	await fx_player.finished

	fx_player.queue_free()

func play_sfx_type(type: String):
	match type:
		"click":
			play_sfx(click_sfx, 0.5)
		"correct":
			play_sfx(correct_sfx, 0.5)
		"fail":
			play_sfx(fail_sfx)
		"pick":
			play_sfx(pick_sfx, 0.5)
		"success":
			play_sfx(success_sfx)
		"times_out":
			play_sfx(times_out_sfx)
		"wrong":
			play_sfx(wrong_sfx, 0.25)
		"next_kuis":
			play_sfx(next_kuis_sfx, -0.75)
