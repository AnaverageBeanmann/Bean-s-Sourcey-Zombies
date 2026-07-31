AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/headcrab.mdl"
ENT.StartHealth = 20
ENT.HullType = HULL_TINY
--------------------
ENT.CanOpenDoors = false
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
--------------------
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.BloodDecalUseGMod = true -- can't find this in the creature base or the ai core, but it still works??
ENT.HasBloodPool = false
--------------------
ENT.HasMeleeAttack = false
--------------------
ENT.HasLeapAttack = true
ENT.LeapAttackDamage = 10
ENT.AnimTbl_LeapAttack = ACT_RANGE_ATTACK1
ENT.LeapAttackMinDistance = 0
ENT.LeapAttackMaxDistance = 300
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackAngleRadius = 10
ENT.TimeUntilLeapAttackDamage = 0.45
ENT.TimeUntilLeapAttackVelocity = 0.415 -- can't use events :(
ENT.NextLeapAttackTime = VJ.SET(1,1.5)
ENT.LeapAttackExtraTimers = {0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1, 1.05}
--------------------
ENT.DisableFootStepSoundTimer = true
ENT.SoundTbl_FootStep = {
	"npc/headcrab_poison/ph_step1.wav",
	"npc/headcrab_poison/ph_step2.wav",
	"npc/headcrab_poison/ph_step3.wav",
	"npc/headcrab_poison/ph_step4.wav"
}
ENT.SoundTbl_Idle = {
	"npc/headcrab/idle1.wav",
	"npc/headcrab/idle2.wav",
	"npc/headcrab/idle3.wav"
}
ENT.SoundTbl_Alert = "npc/headcrab/alert1.wav"
ENT.SoundTbl_BeforeLeapAttack = {
	"npc/headcrab/attack1.wav",
	"npc/headcrab/attack2.wav",
	"npc/headcrab/attack3.wav"
}
ENT.SoundTbl_LeapAttackDamage = "npc/headcrab/headbite.wav"
ENT.SoundTbl_Pain = {
	"npc/headcrab/pain1.wav",
	"npc/headcrab/pain2.wav",
	"npc/headcrab/pain3.wav"
}
ENT.SoundTbl_Death = {
	"npc/headcrab/die1.wav",
	"npc/headcrab/die2.wav"
}
ENT.FootstepSoundLevel = 50
ENT.IdleSoundLevel = 60
ENT.AlertSoundLevel = 65 -- or 70
ENT.BeforeLeapAttackSoundLevel = 70
ENT.PainSoundLevel = 65
ENT.DeathSoundLevel = 65
ENT.MainSoundPitch = VJ.SET(95, 105)
ENT.MainSoundPitchStatic = false
--------------------
-- Burrowing
ENT.BSZ_Headcrab_CanBurrow = true
ENT.BSZ_Headcrab_IsBurrowed = false
ENT.BSZ_Headcrab_JumpBurrowCounter = 10
ENT.BSZ_Headcrab_BurrowWhenPossible = false
ENT.BSZ_Headcrab_UnburrowTime = CurTime()
ENT.BSZ_Headcrab_BurrowedBecauseDistance = false
-- Hanging
ENT.BSZ_Headcrab_IsHanging = false
ENT.BSZ_Headcrab_FallingFromHang = false
-- Drowning
ENT.BSZ_Headcrab_IsDrowning = false
ENT.BSZ_Headcrab_DrownDamageTime = CurTime()
-- Misc
-- ENT.BSZ_Headcrab_Spawning = false
ENT.BSZ_Headcrab_SpawnedFromZombie = false
ENT.BSZ_Headcrab_FreeFalling = false
--------------------
function ENT:BSZ_Headcrab_ApplyBurrowedEffects()

	self:SetNoDraw(true)
	self.GodMode = true
	self:AddFlags(FL_NOTARGET)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	self.HasLeapAttack = false
	self.HasSounds = false
	self:SetFOV(360)

end
--------------------
function ENT:BSZ_Headcrab_Unborrow()

	self.BSZ_Headcrab_IsBurrowed = false
	self.GodMode = false
	self:RemoveFlags(FL_NOTARGET)
	self:SetCollisionGroup(COLLISION_GROUP_NPC)
	if !self.BSZ_Headcrab_IsDrowning then self.HasLeapAttack = true end
	self.HasSounds = true
	self:SetFOV(156)
	self:PlayAnim("vjseq_burrowout", true, 1.5, false)
	if self.IsGuard then self.IsGuard = false end
	if self.BSZ_Headcrab_BurrowedBecauseDistance then self.BSZ_Headcrab_BurrowedBecauseDistance = false end

end
--------------------
function ENT:BSZ_Headcrab_DoBurrowDustEffect()

	VJ.EmitSound(self, "npc/antlion/digdown1.wav", 60, math.random(95,105))
	-- ideas:
		-- have the color change depending on the material
		-- add convar that prevents it from burrowing/unborrowing on solid material
			-- if it tries to unburrow, teleport it back to the last valid spot it was on
	local effectBlood = EffectData()
	effectBlood:SetOrigin(self:GetPos() + self:GetForward() * 5)
	-- effectBlood:SetColor(VJ_Color2Byte(Color(133,133,133)))
	-- effectBlood:SetScale(35)
	util.Effect("bsz_burrowdirt",effectBlood)

end
--------------------
function ENT:BSZ_Headcrab_UnburrowStuckCheck()
	local myCenterPos = self:GetPos() + self:OBBCenter()
	local tr1 = util.TraceLine({
		start = myCenterPos,
		endpos = myCenterPos + self:GetForward()*15 + self:GetUp() * 20,
		filter = self
	})
	local tr2 = util.TraceLine({
		start = myCenterPos,
		endpos = myCenterPos + self:GetForward()*-15 + self:GetUp() * 20,
		filter = self
	})
	local tr3 = util.TraceLine({
		start = myCenterPos,
		endpos = myCenterPos + self:GetRight()*15 + self:GetUp() * 20,
		filter = self
	})
	local tr4 = util.TraceLine({
		start = myCenterPos,
		endpos = myCenterPos + self:GetRight()*-15 + self:GetUp() * 20,
		filter = self
	})
	if !tr1.Hit && !tr2.Hit && !tr3.Hit && !tr4.Hit then
		return true
	else
		return false
	end
end
--------------------
-- function ENT:BSZ_Headcrab_FreeFallCheck()
	-- local myCenterPos = self:GetPos() + self:OBBCenter()
	-- local tr1 = util.TraceLine({
		-- start = myCenterPos,
		-- endpos = myCenterPos + self:GetForward()*15 + self:GetUp() * -20,
		-- filter = self
	-- })
	-- local tr2 = util.TraceLine({
		-- start = myCenterPos,
		-- endpos = myCenterPos + self:GetForward()*-15 + self:GetUp() * -20,
		-- filter = self
	-- })
	-- local tr3 = util.TraceLine({
		-- start = myCenterPos,
		-- endpos = myCenterPos + self:GetRight()*15 + self:GetUp() * -20,
		-- filter = self
	-- })
	-- local tr4 = util.TraceLine({
		-- start = myCenterPos,
		-- endpos = myCenterPos + self:GetRight()*-15 + self:GetUp() * -20,
		-- filter = self
	-- })
	-- if
		-- (tr1.Hit && (tr1.HitNonWorld || tr1.Entity.IsNPC())) or
		-- (tr2.Hit && (tr2.HitNonWorld || tr2.Entity.IsNPC())) or
		-- (tr3.Hit && (tr3.HitNonWorld || tr3.Entity.IsNPC())) or
		-- (tr4.Hit && (tr4.HitNonWorld || tr4.Entity.IsNPC()))
	-- then
		-- return true
	-- else
		-- return false
	-- end
-- end
--------------------
function ENT:BSZ_Headcrab_IsGroundCheck()
	-- if you're asking "why not just use IsOnGround()?" it's because it isn't 100% reliable
	local groundchecktracer = util.TraceLine({
		start = self:GetPos() + self:OBBCenter(),
		endpos = self:GetPos() + self:OBBCenter() + self:GetUp() * -10,
		filter = self
	})
	if groundchecktracer.HitWorld then
		if self.BSZ_Headcrab_FreeFalling then
			self.BSZ_Headcrab_FreeFalling = false
			self:SetState()
			self:PlayAnim("vjseq_ceiling_land", true, 0.65, false)
			timer.Simple(1, function() if IsValid(self) && !self.BSZ_Headcrab_IsDrowning then
				self.HasLeapAttack = true
			end end)
		end
		return true
	else
	
		if self.BSZ_Headcrab_FreeFalling && (groundchecktracer.HitNonWorld || groundchecktracer.Entity.IsNPC()) then
			-- PrintMessage(4,"test")
			self:SetGroundEntity(NULL)
			self:SetState(VJ_STATE_ONLY_ANIMATION)
			self:SetLocalVelocity(Vector(math.random(-75,75), math.random(-75,75), math.Rand(150, 175)))
			-- timer.Simple(0.05, function() if IsValid(self) then
				-- self:PlayAnim("drown", true, false, false)
			-- end end)
		end
		return false
	end
end
--------------------
function ENT:BSZ_DoSpawnSequence()

	local ZombSpawnSprite = ents.Create("env_sprite")
	ZombSpawnSprite:SetKeyValue("model","sprites/flare1.vmt")
	ZombSpawnSprite:SetPos(self:GetPos() + self:GetUp() * -20)
	ZombSpawnSprite:SetKeyValue("scale", "0.01")
	ZombSpawnSprite:SetKeyValue("rendermode","5")
	ZombSpawnSprite:SetKeyValue("rendercolor","0 0 0 255")
	ZombSpawnSprite:SetKeyValue("spawnflags","1")
	ZombSpawnSprite:Spawn()
	ZombSpawnSprite:Activate()

	local ZombSpawnLight = ents.Create("light_dynamic")
	ZombSpawnLight:SetKeyValue("brightness", "5")
	ZombSpawnLight:SetKeyValue("distance", "5")
	ZombSpawnLight:SetPos(self:GetPos() + self:OBBCenter())
	ZombSpawnLight:SetAngles(self:GetAngles())
	ZombSpawnLight:Fire("Color", "0 0 0 0")
	ZombSpawnLight:Spawn()
	ZombSpawnLight:Activate()
	ZombSpawnLight:Fire("TurnOn", "", 0)

	-- local ZombSpawnSpriteBlueness = "0"
	local ZombSpawnSpriteGreenness = "0"
	local ZombSpawnSpriteSize = "0.0"
	local ZombSpawnLightDistance = "5"
	
	for i=1,90 do
		timer.Simple(0.025*i, function() if IsValid(ZombSpawnSprite) then
			ZombSpawnSpriteSize = ZombSpawnSpriteSize + 0.008
			-- ZombSpawnSpriteBlueness = ZombSpawnSpriteBlueness + 2.3
			ZombSpawnSpriteGreenness = ZombSpawnSpriteGreenness + 2
			ZombSpawnLightDistance = ZombSpawnLightDistance + 0.75
			-- PrintMessage(4,""..ZombSpawnSpriteBlueness.."")
			ZombSpawnSprite:SetKeyValue("scale", ZombSpawnSpriteSize)
			-- ZombSpawnSprite:SetKeyValue("rendercolor", "0 "..ZombSpawnSpriteGreenness.." "..ZombSpawnSpriteBlueness.." 255")
			ZombSpawnSprite:SetKeyValue("rendercolor", "0 "..ZombSpawnSpriteGreenness.." 0 255")
			ZombSpawnLight:SetKeyValue("distance", ZombSpawnLightDistance)
			-- ZombSpawnLight:Fire("Color", "0 "..ZombSpawnSpriteGreenness.." "..ZombSpawnSpriteBlueness.." 0")
			ZombSpawnLight:Fire("Color", "0 "..ZombSpawnSpriteGreenness.." 0 0")
			-- PrintMessage(4,""..ZombSpawnLightDistance.."")
		end end)
	end

	self:SetState(VJ_STATE_ONLY_ANIMATION_NOATTACK)
	self:SetNoDraw(true)
	self.GodMode = true
	self.CanInvestigate = false
	self.HasSounds = false
	self.BSZ_Headcrab_CanBurrow = false

	VJ.EmitSound(self, "ambient/levels/labs/teleport_preblast_suckin1.wav", 75, math.random(95,105))

	-- for i=1,4 do
		-- timer.Simple(0.5*i, function()
			-- local effectBlood = EffectData()
			-- effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
			-- util.Effect("bsz_zombiegas", effectBlood)
		-- end)
	-- end

	timer.Simple(2.3, function()

		if IsValid(self) then

			self:SetState()
			self:SetNoDraw(false)
			self.GodMode = false
			self.CanInvestigate = true
			self.HasSounds = true
			self.BSZ_Headcrab_CanBurrow = true
			if self.Alerted && IsValid(self:GetEnemy()) then
				self:PlaySoundSystem("Alert")
			end

			local ed = EffectData()
			ed:SetEntity( self )
			util.Effect( "propspawn", ed, true, true )

			-- local effectBlood = EffectData()
			-- effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
			-- util.Effect("bsz_zombiegas", effectBlood)

			local colorcyan = Color(0, 225, 0, 155)
			-- effects.BeamRingPoint(self:GetPos() + self:OBBCenter() + self:GetUp() * 20, 1, 0, 50, 2.5, 0, colorcyan)
			effects.BeamRingPoint(self:GetPos() + self:OBBCenter(), 1, 0, 50, 2.5, 0, colorcyan)
			-- effects.BeamRingPoint(self:GetPos() + self:OBBCenter() + self:GetUp() * -20, 1, 0, 50, 2.5, 0, colorcyan)

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
					ZombSpawnSpriteSize = ZombSpawnSpriteSize - 0.018
					-- ZombSpawnSpriteBlueness = ZombSpawnSpriteBlueness - 4.6
					ZombSpawnSpriteGreenness = ZombSpawnSpriteGreenness - 2.5
					-- PrintMessage(4,""..ZombSpawnSpriteBlueness.."")
					ZombSpawnSprite:SetKeyValue("scale", ZombSpawnSpriteSize)
					-- ZombSpawnSprite:SetKeyValue("rendercolor", "0 "..ZombSpawnSpriteGreenness.." "..ZombSpawnSpriteBlueness.." 255")
					ZombSpawnSprite:SetKeyValue("rendercolor", "0 "..ZombSpawnSpriteGreenness.." 0 255")
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
function ENT:PreInit()
	if self.BSZ_Headcrab_IsHanging then
		self.MovementType = VJ_MOVETYPE_STATIONARY
		self.CanTurnWhileStationary = false
	end
end
--------------------
function ENT:Init()

	-- PrintMessage(4,"test")
	self:SetCollisionBounds(Vector(7,7,15), Vector(-7,-7,0))
	self:SetSurroundingBounds(Vector(14,14,30), Vector(-14,-14,0))
	self:SetViewOffset(Vector(0,0,0)) -- i don't think this does anything

	if self.BSZ_Headcrab_SpawnedFromZombie then
		self.BSZ_Headcrab_FreeFalling = true
		self.HasLeapAttack = false
		-- anti-stuck failsafe
		timer.Simple(10, function() if IsValid(self) && self.BSZ_Headcrab_FreeFalling then
			self.Bleeds = false
			self:TakeDamage(self:Health() * 2)
		end end)
	end

	if self.BSZ_Headcrab_IsHanging then
		self:SetGroundEntity(NULL)
		self:AddFlags(FL_FLY)
		self:SetNavType(NAV_FLY)
		self:SetState(VJ_STATE_ONLY_ANIMATION)
		self.ConstantlyFaceEnemy_IfVisible = false
		self.HasLeapAttack = false
	else
		if self.BSZ_Headcrab_SpawnedFromZombie then return end
		if GetConVar("bsz_spawnintros"):GetInt() == 1 then
			self:BSZ_DoSpawnSequence()
			-- self.BSZ_Headcrab_Spawning = true
			-- self:SetNoDraw(true)
			-- timer.Simple(0.11, function() if IsValid(self) then
				-- if !self.IsGuard then
					-- self:PlayAnim("vjseq_burrowout", true, 1.5, false)
				-- else
					-- self.BSZ_Headcrab_IsBurrowed = true
					-- self:BSZ_Headcrab_ApplyBurrowedEffects()
				-- end
			-- end end)
		else
			local ed = EffectData()
			ed:SetEntity( self )
			util.Effect( "propspawn", ed, true, true )
		end
	end

end	
--------------------
function ENT:OnThink()
	-- if self.HasSounds then
	-- if self:BSZ_Headcrab_IsGroundCheck() then
		-- PrintMessage(4,"yes")
	-- else
		-- PrintMessage(4,"no")
	-- end

	if self.BSZ_Headcrab_IsBurrowed then
		if IsValid(self:GetEnemy()) then
			if self.IsGuard or self.BSZ_Headcrab_BurrowedBecauseDistance then
				if self:GetPos():Distance(self:GetEnemy():GetPos()) <= 200 && math.random(1,3) == 1 then
					self:BSZ_Headcrab_Unborrow()
				end
			else
				if self.BSZ_Headcrab_UnburrowTime < CurTime() then
					if self:BSZ_Headcrab_UnburrowStuckCheck() then
						-- PrintMessage(4,"yes")
						self:BSZ_Headcrab_Unborrow()
					else
						-- PrintMessage(4,"no")
						self.BSZ_Headcrab_UnburrowTime = CurTime() + 1
					end
				end
			end
		else
			if !self.IsGuard && self.BSZ_Headcrab_UnburrowTime < CurTime() then
				if self:BSZ_Headcrab_UnburrowStuckCheck() then
					self:BSZ_Headcrab_Unborrow()
				else
					self.BSZ_Headcrab_UnburrowTime = CurTime() + 1
				end
			end
		end
		if self.BSZ_Headcrab_IsDrowning && self:BSZ_Headcrab_UnburrowStuckCheck() then
			self:BSZ_Headcrab_Unborrow()
		end
	elseif !self.BSZ_Headcrab_IsBurrowed && self:BSZ_Headcrab_IsGroundCheck() && self.BSZ_Headcrab_CanBurrow && !self.BSZ_Headcrab_IsDrowning then
		if self.IsGuard then
			self.BSZ_Headcrab_IsBurrowed = true
			self:PlayAnim("vjseq_burrowin", true, 2, false)
		else
			if self.BSZ_Headcrab_BurrowWhenPossible && !self:IsBusy() then
				self.BSZ_Headcrab_BurrowWhenPossible = false
				self.BSZ_Headcrab_IsBurrowed = true
				self.BSZ_Headcrab_UnburrowTime = CurTime() + math.random(4,10)
				self:PlayAnim("vjseq_burrowin", true, 2, false)
			else
				if IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) >= 400 then
					self.BSZ_Headcrab_IsBurrowed = true
					self.BSZ_Headcrab_BurrowedBecauseDistance = true
					self:PlayAnim("vjseq_burrowin", true, 2, false)
				end
			end
		end
	end

	if self.BSZ_Headcrab_IsDrowning && self.BSZ_Headcrab_DrownDamageTime < CurTime() then
		self.BSZ_Headcrab_DrownDamageTime = CurTime() + 1
		self:SetHealth(self:Health() - 3)
		if self:Health() < 1 then
			self.Bleeds = false
			self:TakeDamage(10)
		end
	end

	if !self.BSZ_Headcrab_IsDrowning && self:WaterLevel() > 1 then
		self.BSZ_Headcrab_IsDrowning = true
		self.MovementType = VJ_MOVETYPE_STATIONARY
		self:DoChangeMovementType(self.MovementType)
		self.CanTurnWhileStationary = false
		self.HasLeapAttack = false
		self:ClearGoal()
	elseif self.BSZ_Headcrab_IsDrowning && self:WaterLevel() < 1 then
		self.BSZ_Headcrab_IsDrowning = false
		self.MovementType = VJ_MOVETYPE_GROUND
		self:DoChangeMovementType(self.MovementType)
		self.CanTurnWhileStationary = true
		self.HasLeapAttack = true
	end

	-- if self.BSZ_Headcrab_FreeFalling && self:BSZ_Headcrab_FreeFallCheck() then
		-- self:SetGroundEntity(NULL)
		-- self:SetState(VJ_STATE_ONLY_ANIMATION)
		-- self:SetLocalVelocity(Vector(math.random(-75,75), math.random(-75,75), math.Rand(150, 175)))
		-- self:PlayAnim("drown", true, false, false)
	-- end

	if self.BSZ_Headcrab_IsHanging && self.Alerted && IsValid(self:GetEnemy()) && self:Visible(self:GetEnemy()) then

		self:PlayAnim("vjseq_ceiling_Detach", true, 0.5, false)
		self.BSZ_Headcrab_FallingFromHang = true
		self.BSZ_Headcrab_IsHanging = false

		timer.Simple(0.25, function() if IsValid(self) then

			self.MovementType = VJ_MOVETYPE_GROUND
			self:DoChangeMovementType(self.MovementType)
			self.CanTurnWhileStationary = true
			self:SetVelocity(Vector(0,0,0))

		end end)

	elseif self.BSZ_Headcrab_FallingFromHang then

		local myCenterPos = self:GetPos() + self:OBBCenter()
		local tr1 = util.TraceLine({
			start = myCenterPos,
			endpos = myCenterPos + self:GetUp() * -100,
			filter = self
		})
		-- if self:IsOnGround() then
		if tr1.Hit then

			self.BSZ_Headcrab_FallingFromHang = false
			self:SetState()
			self:SetAnimationTranslations()
			self:PlayAnim("vjseq_ceiling_land", true, 0.65, false)
			self.ConstantlyFaceEnemy_IfVisible = true
			self.HasLeapAttack = true

		end

	end

end
--------------------
function ENT:OnInput(key, activator, caller, data)

	if key == "step" then

		self:PlayFootstepSound()

	elseif key == "land" then

		if self:IsOnGround() then
			VJ.EmitSound(self, self.SoundTbl_FootStep, self.FootstepSoundLevel, math.random(95,105))
		end

	elseif key == "burrow_sound" then

		self:BSZ_Headcrab_DoBurrowDustEffect()

	elseif key == "burrow_hide" then

		self:BSZ_Headcrab_ApplyBurrowedEffects()

	elseif key == "unburrow" then

		self:SetNoDraw(false)
		self:RemoveAllDecals()

		self:BSZ_Headcrab_DoBurrowDustEffect()

	end
end
--------------------
-- function ENT:OnAlert(ent)

	-- if self.BSZ_Headcrab_IsHanging then

		-- self:PlayAnim("vjseq_ceiling_Detach", true, 0.5, false)
		-- self.BSZ_Headcrab_FallingFromHang = true
		-- self.BSZ_Headcrab_IsHanging = false

		-- timer.Simple(0.25, function() if IsValid(self) then

			-- self.MovementType = VJ_MOVETYPE_GROUND
			-- self:DoChangeMovementType(self.MovementType)
			-- self:SetVelocity(Vector(0,0,0))

		-- end end)

	-- end

-- end
--------------------
function ENT:OnLeapAttack(status, enemy)

	if status == "Jump" then

		if !self.BSZ_Headcrab_BurrowWhenPossible then
			self.BSZ_Headcrab_JumpBurrowCounter = self.BSZ_Headcrab_JumpBurrowCounter - 1
			if math.random(1,self.BSZ_Headcrab_JumpBurrowCounter) == 1 then
				self.BSZ_Headcrab_BurrowWhenPossible = true
				self.BSZ_Headcrab_JumpBurrowCounter = 10
			end
		end
		-- PrintMessage(4,"jumped "..self.BSZ_Headcrab_TimesJumped.." times")
		return VJ.CalculateTrajectory(self, NULL, "Curve", self:GetPos() + self:OBBCenter(), self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1) + self:GetForward() * 20 + self:GetUp() * 30

	end

end
--------------------
function ENT:OnLeapAttackExecute(status, ent)

	if status == "PreDamage" then

		if !(ent:GetForward():Dot((self:GetPos() -ent:GetPos()):GetNormalized()) > math.cos(math.rad(60))) then
			-- PrintMessage(4,"test")
			self.LeapAttackDamage = 20
			timer.Simple(0.2, function() if IsValid(self) then self.LeapAttackDamage = 10 end end)
		end

	end

end
--------------------
function ENT:OnKilledEnemy(ent, inflictor, wasLast)

	if ent:LookupBone("ValveBiped.Bip01_Pelvis") == nil or ent:LookupBone("ValveBiped.Bip01_Head1") == nil then return end

	self.BSZ_Headcrab_VictimZombie = ents.Create("npc_bsz_crabbed")
	self.BSZ_Headcrab_VictimZombie:SetLocalPos(ent:GetPos())
	self.BSZ_Headcrab_VictimZombie:SetLocalAngles(ent:GetAngles())
	self.BSZ_Headcrab_VictimZombie.BSZ_Zombie_SpawnedFromCrab = true
	self.BSZ_Headcrab_VictimZombie.BSZ_Crabbed_Model = ent:GetModel()
	self.BSZ_Headcrab_VictimZombie:Spawn()
	self.BSZ_Headcrab_VictimZombie:Activate()

	if ent.IsVJBaseSNPC == true then
		ent.HasDeathCorpse = false
		ent.HasDeathAnimation = false
		ent.CanGib = false
	elseif ent.IsDrGNextbot then
		ent.RagdollOnDeath = false
	elseif ent:IsPlayer() then
		if IsValid(ent:GetRagdollEntity()) then
			ent:GetRagdollEntity():Remove()
		end
	elseif ent:IsNPC() or ent:IsNextBot() then
		ent.HasRagdoll = false
		SafeRemoveEntity(ent)
	end	

	SafeRemoveEntity(self)

end
--------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)

	self.HasDeathSounds = false

	if self.HasGibOnDeathEffects then

		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		-- effectBlood:SetColor(VJ_Color2Byte(Color(255,221,0)))
		-- effectBlood:SetScale(25)
		util.Effect("bsz_gibbed_headcrab", effectBlood)

		ParticleEffect("blood_impact_yellow_01", self:GetPos() + self:OBBCenter(), self:GetAngles(), self)
		ParticleEffect("blood_impact_yellow_01", self:GetPos() + self:OBBCenter(), self:GetAngles(), self)

	end

	for i = 1, math.random(3,5) do
		self:CreateGibEntity(
			"obj_vj_gib",
			"UseAlien_Small",
			{
				Pos = self:GetPos() + self:OBBCenter(),
				CollisionDecal = "YellowBlood"
			}
		)
	end

	self:PlaySoundSystem("Gib", "physics/flesh/flesh_bloody_break.wav")

	return true, {AllowSound = false}

end
--------------------
function ENT:TranslateActivity(act)
	if act == ACT_IDLE then
		if self.BSZ_Headcrab_FreeFalling or self.BSZ_Headcrab_IsDrowning then
			return ACT_HOP
		elseif self.BSZ_Headcrab_IsHanging then
			return ACT_IDLE_STEALTH
		elseif self.BSZ_Headcrab_FallingFromHang then
			return ACT_GLIDE
		end
	elseif act == ACT_RUN && self.BSZ_Headcrab_IsBurrowed then
		return ACT_RUN_STEALTH
	end
	return act
end