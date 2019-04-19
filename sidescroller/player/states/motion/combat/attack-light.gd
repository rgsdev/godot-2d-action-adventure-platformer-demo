extends Attack

export(float) var amount := 10.0


func enter(host: Player) -> void:
	host.velocity.x = 0
	host.get_node('AnimationPlayer').play('AttackLight')
	$DamageZone.set_amount(amount)


func _on_animation_finished(anim_name: String, host: Player) -> void:
	if host.is_combo_over:
		emit_signal('finished', 'CombatIdle')
	else:
		emit_signal('finished', 'AttackMedium')