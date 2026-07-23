extends Upgrade


func power_up():
	player.max_jumps += 1

func power_down():
	player.max_jumps -= 1
