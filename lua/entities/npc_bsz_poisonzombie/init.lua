AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/poisonzombie.mdl"
ENT.StartHealth = 350
--------------------
ENT.CanOpenDoors = false
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.PropInteraction_MaxScale = 0.5
--------------------
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodDecalUseGMod = true
ENT.HasBloodPool = false
--------------------
ENT.MeleeAttackDamage = 15
ENT.TimeUntilMeleeAttackDamage = false
--------------------
ENT.HasRangeAttack = true
ENT.RangeAttackProjectiles = "obj_bsz_poisonspit"
ENT.AnimTbl_RangeAttack = ACT_RANGE_ATTACK1
ENT.RangeAttackMinDistance = 75
ENT.RangeAttackMaxDistance = 500
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = VJ.SET(5,10)
--------------------
ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true
-- ENT.SoundTbl_FootStep = "npc/zombie_poison/pz_left_foot1.wav"
ENT.SoundTbl_FootStep = {
	"npc/zombie/foot1.wav",
	"npc/zombie/foot2.wav",
	"npc/zombie/foot3.wav"
}
ENT.SoundTbl_Idle = {
	"npc/zombie_poison/pz_idle2.wav",
	"npc/zombie_poison/pz_idle3.wav",
	"npc/zombie_poison/pz_idle4.wav"
}
ENT.SoundTbl_Alert = {
	"npc/zombie_poison/pz_alert1.wav",
	"npc/zombie_poison/pz_alert2.wav"
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"npc/zombie_poison/pz_warn1.wav",
	"npc/zombie_poison/pz_warn2.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
	"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"
}
ENT.SoundTbl_BeforeRangeAttack = {
	"npc/zombie_poison/pz_warn1.wav",
	"npc/zombie_poison/pz_warn2.wav"
}
ENT.SoundTbl_Pain = {
	"npc/zombie_poison/pz_pain1.wav",
	"npc/zombie_poison/pz_pain2.wav",
	"npc/zombie_poison/pz_pain3.wav"
}
ENT.SoundTbl_Death = {
	"npc/zombie_poison/pz_die1.wav",
	"npc/zombie_poison/pz_die2.wav"
}
ENT.MainSoundPitch = VJ.SET(95, 105)
ENT.MainSoundPitchStatic = false
--------------------
ENT.BSZ_PoisonZombie_LastRangedAttackWasThrow = false
--------------------
function ENT:BSZ_DoSpawnSequence()

	-- remember to update this if we update the zombie spawn seqeunce stuff

	local ZombSpawnSprite = ents.Create("env_sprite")
	ZombSpawnSprite:SetKeyValue("model","sprites/flare1.vmt")
	ZombSpawnSprite:SetPos(self:GetPos())
	ZombSpawnSprite:SetKeyValue("scale", "0.01")
	ZombSpawnSprite:SetKeyValue("rendermode","5")
	ZombSpawnSprite:SetKeyValue("rendercolor","0 0 0 255")
	ZombSpawnSprite:SetKeyValue("spawnflags","1")
	ZombSpawnSprite:Spawn()
	ZombSpawnSprite:Activate()

	local ZombSpawnLight = ents.Create("light_dynamic")
	ZombSpawnLight:SetKeyValue("brightness", "3")
	ZombSpawnLight:SetKeyValue("distance", "5")
	ZombSpawnLight:SetPos(self:GetPos() + self:OBBCenter())
	ZombSpawnLight:SetAngles(self:GetAngles())
	ZombSpawnLight:Fire("Color", "0 0 0 0")
	-- ZombSpawnLight:SetKeyValue("style", "5")
	ZombSpawnLight:Spawn()
	ZombSpawnLight:Activate()
	ZombSpawnLight:Fire("TurnOn", "", 0)

	local ZombSpawnSpriteRedness = "0"
	local ZombSpawnSpriteSize = "0.0"
	local ZombSpawnLightDistance = "5"
	
	for i=1,90 do
		timer.Simple(0.025*i, function() if IsValid(ZombSpawnSprite) then
			ZombSpawnSpriteSize = ZombSpawnSpriteSize + 0.015
			ZombSpawnSpriteRedness = ZombSpawnSpriteRedness + 2.3
			ZombSpawnLightDistance = ZombSpawnLightDistance + 3
			-- PrintMessage(4,""..ZombSpawnSpriteRedness.."")
			ZombSpawnSprite:SetKeyValue("scale", ZombSpawnSpriteSize)
			ZombSpawnSprite:SetKeyValue("rendercolor", ""..ZombSpawnSpriteRedness.." 0 0 255")
			ZombSpawnLight:SetKeyValue("distance", ZombSpawnLightDistance)
			ZombSpawnLight:Fire("Color", ""..ZombSpawnSpriteRedness.." 0 0 0")
			-- PrintMessage(4,""..ZombSpawnLightDistance.."")
		end end)
	end

	self:SetState(VJ_STATE_ONLY_ANIMATION_NOATTACK)
	self:SetNoDraw(true)
	self.GodMode = true
	self.CanInvestigate = false
	self.HasSounds = false

	VJ.EmitSound(self, "ambient/levels/labs/teleport_preblast_suckin1.wav", 75, math.random(95,105))

	timer.Simple(2.3, function()

		if IsValid(self) then

			self:SetState()
			self:SetNoDraw(false)
			self.GodMode = false
			self.CanInvestigate = true
			self.HasSounds = true
			if self.Alerted && IsValid(self:GetEnemy()) then
				self:PlaySoundSystem("Alert")
			end

			local ed = EffectData()
			ed:SetEntity( self )
			util.Effect( "propspawn", ed, true, true )

			effects.BeamRingPoint(self:GetPos() + self:OBBCenter(), 1, 0, 100, 5, 0, Color(100, 0, 0))

			local citadelsounds = {
				"ambient/levels/citadel/strange_talk1.wav",
				"ambient/levels/citadel/strange_talk3.wav",
				"ambient/levels/citadel/strange_talk4.wav",
				"ambient/levels/citadel/strange_talk5.wav",
				"ambient/levels/citadel/strange_talk6.wav",
				"ambient/levels/citadel/strange_talk7.wav",
				"ambient/levels/citadel/strange_talk8.wav",
				"ambient/levels/citadel/strange_talk9.wav",
				"ambient/levels/citadel/strange_talk10.wav",
				"ambient/levels/citadel/strange_talk11.wav"
			}

			VJ.EmitSound(self, citadelsounds, 75, math.random(95,105))
			VJ.EmitSound(self, "ambient/machines/teleport1.wav", 75, math.random(85,90))

		end

		if IsValid(ZombSpawnSprite) then

			-- ZombSpawnSprite:Remove()

			for i=1,45 do
				timer.Simple(0.025*i, function() if IsValid(ZombSpawnSprite) then
					ZombSpawnSpriteSize = ZombSpawnSpriteSize - 0.030
					ZombSpawnSpriteRedness = ZombSpawnSpriteRedness - 4.6
					-- PrintMessage(4,""..ZombSpawnSpriteRedness.."")
					ZombSpawnSprite:SetKeyValue("scale", ZombSpawnSpriteSize)
					ZombSpawnSprite:SetKeyValue("rendercolor", ""..ZombSpawnSpriteRedness.." 0 0 255")
				end end)
			end

			timer.Simple(1, function() if IsValid(ZombSpawnSprite) then

				ZombSpawnSprite:Remove()

			end end)

		end

		if IsValid(ZombSpawnLight) then

			for i=1,45 do

				timer.Simple(0.025*i, function() if IsValid(ZombSpawnLight) then
					ZombSpawnLightDistance = ZombSpawnLightDistance - 6
					ZombSpawnLight:SetKeyValue("distance", ZombSpawnLightDistance)
				end end)

			end

			timer.Simple(1, function() if IsValid(ZombSpawnLight) then
				ZombSpawnLight:Remove()

			end end)

		end

	end)
end
--------------------
function ENT:Init()

	if GetConVar("bbohgg_nogodsnomasters"):GetInt() == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
	end

	-- self:BSZ_Zombie_CustomOnInit()

	if GetConVar("bbohgg_spawnsequences"):GetInt() == 1 then
		self:BSZ_DoSpawnSequence()
	else
		local ed = EffectData()
		ed:SetEntity( self )
		util.Effect( "propspawn", ed, true, true )
	end

end
--------------------
function ENT:OnInput(key, activator, caller, data)

	if key == "step" then

		self:PlayFootstepSound()

	elseif key == "scuff" then

		VJ.EmitSound(self, "npc/zombie/foot_slide"..math.random(1,3)..".wav", 60, math.random(95,105))

	elseif key == "attack" then

		self:ExecuteMeleeAttack()

	elseif key == "flesh_grab" then

		ParticleEffect("blood_impact_red_01", self:GetAttachment(self:LookupAttachment("Blood_Right")).Pos, self:GetAngles(), self)
		VJ.EmitSound(self, "physics/body/body_medium_break"..math.random(2,4)..".wav", 70, math.random(95,105))

	elseif key == "flesh_throw" || key == "spit" then

		if key == "spit" then
			self.SoundTbl_RangeAttack = {
				"bullchicken/bc_attack2.wav",
				"bullchicken/bc_attack3.wav"
			}
			self:ExecuteRangeAttack()
		else
			self.CanFlinch = false
			self.HasPainSounds = false
			self.SoundTbl_RangeAttack = {
				"npc/zombie_poison/pz_throw2.wav",
				"npc/zombie_poison/pz_throw3.wav"
			}
			for i=1,math.random(3,5) do
				if math.random(1,3) == 1 then
					self.RangeAttackProjectiles = "obj_bsz_flesh_toxic"
				else
					self.RangeAttackProjectiles = "obj_bsz_flesh"
				end
				self:ExecuteRangeAttack()
				self:TakeDamage(3, self, self)
			end
			self.CanFlinch = true
			self.HasPainSounds = true
		end

	-- elseif key == "releasecrab" then

		-- self:BSZ_Zombie_CrabUnlatchEffects("Yes")

	-- elseif key == "doorpound" then

		-- self:BSZ_AttackDoor()

	end

end
--------------------
function ENT:OnRangeAttack(status, enemy)
	if status == "PreInit" then
		if self.EnemyData.Distance < 225 && !self.BSZ_PoisonZombie_LastRangedAttackWasThrow then
			self.BSZ_PoisonZombie_LastRangedAttackWasThrow = true
			self.AnimTbl_RangeAttack = ACT_RANGE_ATTACK2
		elseif self.EnemyData.Distance >= 225 && self.BSZ_PoisonZombie_LastRangedAttackWasThrow then
			self.BSZ_PoisonZombie_LastRangedAttackWasThrow = false
			self.RangeAttackProjectiles = "obj_bsz_poisonspit"
			self.AnimTbl_RangeAttack = ACT_RANGE_ATTACK1
		end
	elseif status == "PostInit" then
		if !self.BSZ_PoisonZombie_LastRangedAttackWasThrow then
			VJ.EmitSound(self, "npc/barnacle/barnacle_tongue_pull"..math.random(1,3)..".wav", 70, math.random(100, 115))
		end
	end
end
--------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
	if status == "PreSpawn" && self:IsOnFire() then
		projectile.BSZ_Flesh_Burning = true
	end
end
--------------------
function ENT:RangeAttackProjPos(projectile)
	if self:GetSequence() == self:LookupSequence("spit") then
		return self:GetAttachment(self:LookupAttachment("head")).Pos
	else
		return self:GetAttachment(self:LookupAttachment("Blood_Right")).Pos
	end
end
--------------------
function ENT:RangeAttackProjVel(projectile)
	if self:GetSequence() == self:LookupSequence("spit") then
		return VJ.CalculateTrajectory(self, self:GetEnemy(), "CurveAntlion", projectile:GetPos(), 0.25, 1000)
	else
		return VJ.CalculateTrajectory(self, self:GetEnemy(), "CurveAntlion", projectile:GetPos(), self:GetEnemy():GetPos() + self:GetEnemy():GetRight() * math.random(-25,25) + self:GetEnemy():GetUp() * math.random(-5,75), 600)
	end
end
--------------------
function ENT:TranslateActivity(act)
	if act == ACT_RUN then
		-- if IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 500 then
		if IsValid(self:GetEnemy()) && self.EnemyData.Distance <= 500 then
			-- if self:IsOnFire() then
				-- return ACT_RUN_ON_FIRE
			-- else
				return ACT_WALK_AIM
			-- end
		else
			-- if self:IsOnFire() then
				-- return ACT_WALK_ON_FIRE
			-- else
				return ACT_WALK
			-- end
		end
	-- elseif act == ACT_IDLE then
		-- if self:IsOnFire() then
			-- return ACT_IDLE_ON_FIRE
		-- end
	end
	return act
end