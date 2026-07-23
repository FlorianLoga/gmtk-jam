extends Upgrade


func power_up():
	player.can_tp = true

func power_down():
	player.can_tp = false
