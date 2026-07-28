AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/tank.mdl"
ENT.StartHealth = 4000
--------------------
ENT.UsePoseParameterMovement = true
--------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.PoseParameterLooking_Names = {pitch = {"body_pitch"}, yaw = {"body_yaw"}}
ENT.PropInteraction_MaxScale = 10
--------------------
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodDecalUseGMod = true
ENT.HasBloodPool = false
--------------------
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = "vjseq_death"
--------------------
ENT.MeleeAttackDamage = 25
ENT.MeleeAttackDamageType = DMG_CLUB -- use CRUSH for the incap attack
ENT.HasMeleeAttackKnockBack = true
ENT.AnimTbl_MeleeAttack = {
	"vjges_attack_moving",
	"vjges_Hulk_RunAttack1_gesture",
	"vjges_Hulk_RunAttack2_gesture"
}
ENT.MeleeAttackDistance = 100
ENT.MeleeAttackDamageDistance = 105
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextMeleeAttackTime = 1.5
--------------------
ENT.HasRangeAttack = true
ENT.RangeAttackProjectiles = "obj_bsz_tankrock"
ENT.AnimTbl_RangeAttack = {
	"vjseq_throw_02",
	"vjseq_throw_03",
	"vjseq_throw_04"
}
ENT.RangeAttackMinDistance = 100
ENT.RangeAttackMaxDistance = 1250
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 10
--------------------
ENT.DisableFootStepSoundTimer = true
-- ENT.FootstepSoundTimerWalk = 0.5
-- ENT.FootstepSoundTimerRun = 0.235
ENT.HasSoundTrack = true
ENT.SoundTrackVolume = 0.65
ENT.HasExtraMeleeAttackSounds = true
ENT.SoundTbl_SoundTrack = "music/tank/tank.wav"
ENT.SoundTbl_FootStep = {
	"player/footsteps/tank/walk/tank_walk01.wav",
	"player/footsteps/tank/walk/tank_walk02.wav",
	"player/footsteps/tank/walk/tank_walk03.wav",
	"player/footsteps/tank/walk/tank_walk04.wav",
	"player/footsteps/tank/walk/tank_walk05.wav",
	"player/footsteps/tank/walk/tank_walk06.wav"
}
ENT.SoundTbl_Idle = {
	"player/tank/voice/idle/tank_breathe_01.wav",
	"player/tank/voice/idle/tank_breathe_02.wav",
	"player/tank/voice/idle/tank_breathe_03.wav",
	"player/tank/voice/idle/tank_breathe_04.wav",
	"player/tank/voice/idle/tank_breathe_05.wav",
	"player/tank/voice/idle/tank_breathe_06.wav",
	"player/tank/voice/idle/tank_breathe_07.wav",
	"player/tank/voice/idle/tank_breathe_08.wav",
	"player/tank/voice/idle/tank_growl_01.wav",
	"player/tank/voice/idle/tank_growl_02.wav",
	"player/tank/voice/idle/tank_growl_03.wav",
	"player/tank/voice/idle/tank_growl_09.wav",
	"player/tank/voice/idle/tank_growl_10.wav",
	"player/tank/voice/idle/tank_growl_11.wav",
	"player/tank/voice/idle/tank_growl_12.wav",
	"player/tank/voice/idle/tank_voice_01.wav",
	"player/tank/voice/idle/tank_voice_02.wav",
	"player/tank/voice/idle/tank_voice_03.wav",
	"player/tank/voice/idle/tank_voice_04.wav",
	"player/tank/voice/idle/tank_voice_05.wav",
	"player/tank/voice/idle/tank_voice_06.wav",
	"player/tank/voice/idle/tank_voice_07.wav",
	"player/tank/voice/idle/tank_voice_08.wav",
	"player/tank/voice/idle/tank_voice_09.wav"
}
ENT.SoundTbl_CombatIdle = {
	"player/tank/voice/yell/tank_yell_01.wav",
	"player/tank/voice/yell/tank_yell_02.wav",
	"player/tank/voice/yell/tank_yell_03.wav",
	"player/tank/voice/yell/tank_yell_04.wav",
	"player/tank/voice/yell/tank_yell_05.wav",
	"player/tank/voice/yell/tank_yell_06.wav",
	"player/tank/voice/yell/tank_yell_07.wav",
	"player/tank/voice/yell/tank_yell_08.wav",
	"player/tank/voice/yell/tank_yell_09.wav",
	"player/tank/voice/yell/tank_yell_10.wav",
	"player/tank/voice/yell/tank_yell_12.wav",
	"player/tank/voice/yell/tank_yell_16.wav"
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"player/tank/voice/attack/tank_attack_01.wav",
	"player/tank/voice/attack/tank_attack_02.wav",
	"player/tank/voice/attack/tank_attack_03.wav",
	"player/tank/voice/attack/tank_attack_04.wav",
	"player/tank/voice/attack/tank_attack_05.wav",
	"player/tank/voice/attack/tank_attack_06.wav",
	"player/tank/voice/attack/tank_attack_07.wav",
	"player/tank/voice/attack/tank_attack_08.wav",
	"player/tank/voice/attack/tank_attack_09.wav",
	"player/tank/voice/attack/tank_attack_10.wav"
}
ENT.SoundTbl_MeleeAttackExtra = "player/tank/hit/hulk_punch_1.wav"
ENT.SoundTbl_MeleeAttackMiss = {
	"player/pz/miss/claw_miss_1.wav",
	"player/pz/miss/claw_miss_2.wav"
}
ENT.SoundTbl_BeforeRangeAttack = "player/tank/attack/rip_up_rock_1.wav"
ENT.SoundTbl_RangeAttack = {
	"player/tank/voice/yell/tank_throw_01.wav",
	"player/tank/voice/yell/tank_throw_02.wav",
	"player/tank/voice/yell/tank_throw_03.wav",
	"player/tank/voice/yell/tank_throw_04.wav",
	"player/tank/voice/yell/tank_throw_05.wav",
	"player/tank/voice/yell/tank_throw_06.wav",
	"player/tank/voice/yell/tank_throw_09.wav",
	"player/tank/voice/yell/tank_throw_10.wav",
	"player/tank/voice/yell/tank_throw_11.wav"
}
ENT.SoundTbl_Pain = {
	"player/tank/voice/pain/tank_pain_01.wav",
	"player/tank/voice/pain/tank_pain_02.wav",
	"player/tank/voice/pain/tank_pain_03.wav",
	"player/tank/voice/pain/tank_pain_04.wav",
	"player/tank/voice/pain/tank_pain_05.wav",
	"player/tank/voice/pain/tank_pain_06.wav",
	"player/tank/voice/pain/tank_pain_07.wav",
	"player/tank/voice/pain/tank_pain_08.wav",
	"player/tank/voice/pain/tank_pain_09.wav",
	"player/tank/voice/pain/tank_pain_10.wav"
}
ENT.SoundTbl_Death = {
	"player/tank/voice/die/tank_death_01.wav",
	"player/tank/voice/die/tank_death_02.wav",
	"player/tank/voice/die/tank_death_03.wav",
	"player/tank/voice/die/tank_death_04.wav",
	"player/tank/voice/die/tank_death_05.wav",
	"player/tank/voice/die/tank_death_06.wav",
	"player/tank/voice/die/tank_death_07.wav"
}
ENT.IdleSoundChance = 1
ENT.NextSoundTime_Idle = VJ.SET(3, 6)
ENT.FootstepSoundLevel = 75
ENT.IdleSoundLevel = 80
ENT.BeforeMeleeAttackSoundLevel = 80
ENT.BeforeRangeAttackSoundLevel = 80
ENT.RangeAttackSoundLevel = 80
--------------------
ENT.BSZ_Tank_Raging = false
ENT.BSZ_Tank_ProjectileIsStump = false
--------------------
function ENT:Init()

	if GetConVar("bbohgb_announcetoughenemies"):GetInt() == 2 then
		EmitSound("bbohg/fx/critical_event_1.wav", self:GetPos(), 0, CHAN_AUTO, 1, 0)
		PrintMessage(3,"--=={ A Tank has spawned }==--")
	end

	if GetConVar("bbohgg_nogodsnomasters"):GetInt() == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
	end

end
--------------------
function ENT:OnInput(key, activator, caller, data)


	if key == "step_foot" then

		-- self.FootstepSoundLevel = 75
		self:PlayFootstepSound("npc/zombie/foot"..math.random(1,3)..".wav")

	elseif key == "step_hand" then
		-- self.FootstepSoundLevel = 60
		self:PlayFootstepSound()
		util.ScreenShake(self:GetPos() + self:OBBCenter(), 2.5, 1, 0.5, 1000)

	elseif key == "attack" then

		self:ExecuteMeleeAttack()

	elseif key == "rock_give" then

		self.TankRockModel = ents.Create("prop_dynamic")

		if self:Tank_CheckIfDirt(self:GetPos()) then

			if !self.BSZ_Tank_ProjectileIsStump then
				self.BSZ_Tank_ProjectileIsStump = true
			end

			self.TankRockModel:SetModel("models/props_foliage/tree_trunk.mdl")
			self.TankRockModel:SetLocalPos(self:GetAttachment(self:LookupAttachment("debris")).Pos)
			self.TankRockModel:SetLocalAngles(self:GetAttachment(self:LookupAttachment("debris")).Ang + Angle(0,0,90))

			ParticleEffect("rock_splinter_stalactite", self:GetAttachment(self:LookupAttachment("debris")).Pos, self:GetAngles())

		else

			if self.BSZ_Tank_ProjectileIsStump then
				self.BSZ_Tank_ProjectileIsStump = false
			end

			self.TankRockModel:SetModel("models/props_debris/concrete_chunk01a.mdl")
			self.TankRockModel:SetLocalPos(self:GetAttachment(self:LookupAttachment("debris")).Pos)
			if self:GetSequence() == self:LookupAttachment("throw") then
			else
				self.TankRockModel:SetLocalAngles(self:GetAttachment(self:LookupAttachment("debris")).Ang + Angle(0,90,0))
			end

			ParticleEffect("rock_splinter_stalactite", self:GetAttachment(self:LookupAttachment("debris")).Pos, self:GetAngles())

		end

		local tankrocktrans = 0

		self.TankRockModel:SetParent(self, self:LookupAttachment("debris"))
		self.TankRockModel:SetRenderMode(1)
		self.TankRockModel:SetColor(Color(255,255,255,tankrocktrans))
		self.TankRockModel:Spawn()
		self.TankRockModel:Activate()
		self:DeleteOnRemove(self.TankRockModel)
		
		for i=1,12 do
			timer.Simple(0.05*i, function() if IsValid(self.TankRockModel) then
				tankrocktrans = tankrocktrans + 23
				self.TankRockModel:SetColor(Color(255,255,255,tankrocktrans))
			end end)
		end

		ParticleEffectAttach("hunter_slide_dust", 4, self, 1)
		ParticleEffectAttach("hunter_slide_dust", 4, self, 2)
		ParticleEffectAttach("hunter_slide_dust", 1, self.TankRockModel, 0)

	elseif key == "rock_throw" then

		self:ExecuteRangeAttack()

		if IsValid(self.TankRockModel) then
			self.TankRockModel:Remove()
		end

	elseif key == "rock_throw_chunks" then

		self.RangeAttackProjectiles = "obj_bsz_tankrock_chunk"
		for i=1,math.random(4,6) do
			self:ExecuteRangeAttack()
		end
		self.RangeAttackProjectiles = "obj_bsz_tankrock"
		VJ.EmitSound(self, "player/tank/hit/thrown_projectile_hit_01.wav", 80, math.random(95,105))
		ParticleEffect("door_pound_core", self:GetAttachment(self:LookupAttachment("debris")).Pos + self:GetForward() * 20, self:GetAngles())
		ParticleEffect("strider_wall_smash", self:GetAttachment(self:LookupAttachment("debris")).Pos + self:GetForward() * 20, self:GetAngles())
		if self:Tank_CheckIfDirt(self:GetPos()) then
			ParticleEffect("door_explosion_chunks", self:GetAttachment(self:LookupAttachment("debris")).Pos + self:GetForward() * 20, self:GetAngles())
		else
			ParticleEffect("rock_splinter_stalactite", self:GetAttachment(self:LookupAttachment("debris")).Pos + self:GetForward() * 20, self:GetAngles())
		end

	elseif key == "yell" then

		self:PlaySoundSystem("Speech", self.SoundTbl_CombatIdle)

	elseif key == "body" then

		VJ.EmitSound(self, "physics/body/body_medium_impact_hard"..math.random(1,6)..".wav", 65, math.random(75,80))
		util.ScreenShake(self:GetPos() + self:OBBCenter(), 1.5, 1, 0.25, 750)

	end

end
--------------------
-- function ENT:OnFootstepSound(moveType, sdFile)
-- end
--------------------
-- function ENT:OnAlert(ent)
	-- if IsValid(self:GetEnemy()) then
		-- if !self.EnemyXRayDetection then
			-- self.EnemyXRayDetection = true
		-- end
		-- if !self.HasSoundtrack && GetConVar("vj_npc_snd_track"):GetInt() == 1 then
			-- self.HasSoundTrack = true
			-- self:StartSoundTrack()
		-- end
	-- end
-- end
--------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward() * 500 + self:GetUp() * 100
end
--------------------
-- pretty sure this is from LNR
function ENT:Tank_CheckIfDirt(pos)

	local tr = util.TraceLine({
		start = pos,
		endpos = pos -Vector(0,0,40),
		filter = self,
		mask = MASK_NPCWORLDSTATIC
	})
	local mat = tr.MatType
	return tr.HitWorld && (mat == MAT_SAND || mat == MAT_DIRT || mat == MAT_FOLIAGE || mat == MAT_SLOSH || mat == MAT_GRASS)

end
--------------------
function ENT:OnRangeAttack(status, enemy)
	if status == "PreInit" then
		if IsValid(self:GetEnemy()) && self.EnemyData.Distance <= 625 then
			if math.random(1,5) != 1 then
				return true
			else
				self.AnimTbl_RangeAttack = "vjseq_throw"
				timer.Simple(0.5, function() if IsValid(self) then
					self.AnimTbl_RangeAttack = {
						"vjseq_throw_02",
						"vjseq_throw_03",
						"vjseq_throw_04"
					}
				end end)
			end
		end
		-- if self.BSZ_Tank_Raging then
		-- end
		-- if (self:Health() <= (self:GetMaxHealth() * 0.5) && math.random(1,3) != 1) or math.random(1,6) != 1 then
			-- self.IsAbleToRangeAttack = false
			-- timer.Simple(3, function() if IsValid(self) then
				-- self.IsAbleToRangeAttack = true
			-- end end)
			-- return true
		-- end
	end
	-- if status == "PreInit" then
		-- local randrangeattackanim = math.random(1,3)
		-- if randrangeattackanim == 1 then
			-- self.AnimTbl_RangeAttack = "vjseq_throw_02"
			-- self.TimeUntilRangeAttackProjectileRelease = 2.45
		-- elseif randrangeattackanim == 2 then
			-- self.AnimTbl_RangeAttack = "vjseq_throw_03"
			-- self.TimeUntilRangeAttackProjectileRelease = 2.1
		-- else
			-- self.AnimTbl_RangeAttack = "vjseq_throw_04"
			-- self.TimeUntilRangeAttackProjectileRelease = 2.58
		-- end
	-- elseif status == "PostInit" then

		-- timer.Simple(0.7, function() if IsValid(self) then

			-- if self:Tank_CheckIfDirt(self:GetPos()) then

				-- self.RangeAttackProjectiles = "obj_bsz_tankstump"

				-- self.TankRockModel = ents.Create("prop_dynamic")
				-- self.TankRockModel:SetModel("models/props_foliage/tree_trunk.mdl")
				-- self.TankRockModel:SetLocalPos(self:GetAttachment(self:LookupAttachment("debris")).Pos)
				-- self.TankRockModel:SetLocalAngles(self:GetAttachment(self:LookupAttachment("debris")).Ang + Angle(0,0,90))
				-- self.TankRockModel:SetParent(self, self:LookupAttachment( "debris" ))
				-- self.TankRockModel:Spawn()
				-- self.TankRockModel:Activate()
				-- self:DeleteOnRemove(self.TankRockModel)

				-- local rockdust = EffectData()
				-- rockdust:SetOrigin(self.TankRockModel:GetPos() + self.TankRockModel:OBBCenter())
				-- rockdust:SetColor(VJ_Color2Byte(Color(125,125,125)))
				-- rockdust:SetScale(100)
				-- util.Effect("VJ_Blood1",rockdust)

			-- else

				-- self.TankRockModel = ents.Create("prop_dynamic")
				-- self.TankRockModel:SetModel("models/props_debris/concrete_chunk01a.mdl")
				-- self.TankRockModel:SetLocalPos(self:GetAttachment(self:LookupAttachment("debris")).Pos)
				-- self.TankRockModel:SetLocalAngles(self:GetAttachment(self:LookupAttachment("debris")).Ang + Angle(0,90,0))
				-- self.TankRockModel:SetParent(self, self:LookupAttachment( "debris" ))
				-- self.TankRockModel:Spawn()
				-- self.TankRockModel:Activate()
				-- self:DeleteOnRemove(self.TankRockModel)

				-- local rockdust = EffectData()
				-- rockdust:SetOrigin(self.TankRockModel:GetPos() + self.TankRockModel:OBBCenter())
				-- rockdust:SetColor(VJ_Color2Byte(Color(200,200,200)))
				-- rockdust:SetScale(100)
				-- util.Effect("VJ_Blood1",rockdust)

			-- end

		-- end end)

		-- timer.Simple(self.TimeUntilRangeAttackProjectileRelease + 0.01, function() if IsValid(self) then
			-- if IsValid(self.TankRockModel) then
				-- self.TankRockModel:Remove()
			-- end
		-- end end)

	-- end

end
--------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
	if status == "PreSpawn" then
		if self.BSZ_Tank_ProjectileIsStump then
			projectile.BSZ_TankRock_Type = "Stump"
		end
		-- projectile.DirectDamage = self.MeleeAttackDamage
	elseif status == "PostSpawn" then
		if IsValid(self.TankRockModel) then
			projectile:SetAngles(self.TankRockModel:GetAngles())
		end
		if self:GetSequence() == self:LookupSequence("throw_02") then
			projectile:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-50,50),math.random(100,250),math.random(-100,100)))
		elseif self:GetSequence() == self:LookupSequence("throw_03") then
			projectile:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-50,50),math.random(-100,-250),math.random(100,250)))
		elseif self:GetSequence() == self:LookupAttachment("throw") then
			projectile:GetPhysicsObject():AddAngleVelocity(Vector(math.random(500,1000),math.random(500,1000),math.random(500,1000)))
		else
			projectile:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100,-250),math.random(-50,50),math.random(-50,50)))
		end
		-- if self.RangeAttackProjectiles == "obj_bsz_tankstump" then
			-- self.RangeAttackProjectiles = "obj_bsz_tankrock"
		-- end
	end
end
--------------------
function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("debris")).Pos
end
--------------------
function ENT:RangeAttackProjVel(projectile)
	if self:GetSequence() == self:LookupSequence("throw") then
		return VJ.CalculateTrajectory(self, self:GetEnemy(), "CurveAntlion", projectile:GetPos(), self:GetEnemy():GetPos() + self:GetEnemy():GetRight() * math.random(-75,75) + self:GetEnemy():GetUp() * math.random(25,100), 1700)
	else
		return VJ.CalculateTrajectory(self, self:GetEnemy(), "CurveAntlion", projectile:GetPos(), 0.75, 1650)
	end
end
--------------------
-- function ENT:OnKilledEnemy(ent, inflictor, wasLast)
	-- if !wasLast then
		-- self:PlayAnim("vjseq_rage_at_knockdown_0"..math.random(1,3).."", true, 3, false)
	-- else
		-- self:PlayAnim("vjseq_victory", true, 10)
	-- end
-- end
--------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" && self:IsMoving() then
		self.AnimTbl_Death = "vjseq_death_running_07"
	elseif status == "Finish" then
		VJ.EmitSound(self, "player/tank/fall/tank_death_bodyfall_01.wav", 70, math.random(95,105))
		util.ScreenShake(self:GetPos() + self:OBBCenter(), 2.5, 1, 0.75, 1000)
	end
end
--------------------
function ENT:TranslateActivity(act)
	if IsValid(self:GetEnemy()) && act == ACT_IDLE then
		return ACT_IDLE_ANGRY
	end
	return act
end