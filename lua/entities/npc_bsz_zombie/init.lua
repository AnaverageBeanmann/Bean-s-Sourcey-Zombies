AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/zombie.mdl"
ENT.StartHealth = 100
--------------------
ENT.JumpParams = {
	Enabled = true,
	MaxRise = 100,
	MaxDrop = 1000,
	MaxDistance = 512,
}
--------------------
ENT.CanOpenDoors = false
-- ENT.CanEat = true -- check black mesa zomb anims
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.PropInteraction_MaxScale = 0.5
--------------------
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodDecalUseGMod = true
ENT.HasBloodPool = false
ENT.CanFlinch = true
ENT.FlinchChance = 1
ENT.FlinchHitGroupMap = {
	{HitGroup = {HITGROUP_HEAD}, Animation = {"vjges_flinch_head"}},
	{HitGroup = {HITGROUP_CHEST}, Animation = {"vjges_flinch_chest"}},
	{HitGroup = {HITGROUP_STOMACH}, Animation = {"vjges_flinch_chest"}},
	{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjges_flinch_leftArm"}},
	{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjges_flinch_rightArm"}},
	{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}},
	{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
--------------------
ENT.HasMeleeAttackKnockBack = true
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 45
ENT.TimeUntilMeleeAttackDamage = false
--------------------
ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true
ENT.SoundTbl_FootStep = {
	"npc/zombie/foot1.wav",
	"npc/zombie/foot2.wav",
	"npc/zombie/foot3.wav"
}
ENT.SoundTbl_Idle = {
	"npc/zombie/zombie_voice_idle1.wav",
	"npc/zombie/zombie_voice_idle2.wav",
	"npc/zombie/zombie_voice_idle3.wav",
	"npc/zombie/zombie_voice_idle4.wav",
	"npc/zombie/zombie_voice_idle5.wav",
	"npc/zombie/zombie_voice_idle6.wav",
	"npc/zombie/zombie_voice_idle7.wav",
	"npc/zombie/zombie_voice_idle8.wav",
	"npc/zombie/zombie_voice_idle9.wav",
	"npc/zombie/zombie_voice_idle10.wav",
	"npc/zombie/zombie_voice_idle11.wav",
	"npc/zombie/zombie_voice_idle12.wav",
	"npc/zombie/zombie_voice_idle13.wav",
	"npc/zombie/zombie_voice_idle14.wav",
}
ENT.SoundTbl_Alert = {
	"npc/zombie/zombie_alert1.wav",
	"npc/zombie/zombie_alert2.wav",
	"npc/zombie/zombie_alert3.wav"
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"npc/zombie/zo_attack1.wav",
	"npc/zombie/zo_attack2.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
	"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"
}
ENT.SoundTbl_BeforeRangeAttack = {
	"npc/zombie/zombie_pain1.wav",
	"npc/zombie/zombie_pain2.wav",
	"npc/zombie/zombie_pain3.wav",
	"npc/zombie/zombie_pain4.wav",
	"npc/zombie/zombie_pain5.wav",
	"npc/zombie/zombie_pain6.wav"
}
ENT.SoundTbl_Pain = {
	"npc/zombie/zombie_pain1.wav",
	"npc/zombie/zombie_pain2.wav",
	"npc/zombie/zombie_pain3.wav",
	"npc/zombie/zombie_pain4.wav",
	"npc/zombie/zombie_pain5.wav",
	"npc/zombie/zombie_pain6.wav"
}
ENT.SoundTbl_Death = {
	"npc/zombie/zombie_die1.wav",
	"npc/zombie/zombie_die2.wav",
	"npc/zombie/zombie_die3.wav"
}
ENT.MainSoundPitch = VJ.SET(95, 105)
ENT.MainSoundPitchStatic = false
--------------------
-- Types
ENT.BSZ_Zombie_MainType = "Classic" -- options are Classic, Ghoul, Charred, and Crabbed
ENT.BSZ_Zombie_TypeVariant = "Civvie" -- options are Civvie, GoreBlaster, Rebel, and Medic
ENT.BSZ_Zombie_SubType = nil -- options are nil, "Torso", and "Legs"
-- Melee Stats
ENT.BSZ_Zombie_MeleeDamage = 15
ENT.BSZ_Zombie_MeleeDamage_Duo = 20
ENT.BSZ_Zombie_MeleeDamage_Weak = 10
-- Crab
ENT.BSZ_Zombie_HasCrab = false
ENT.BSZ_Zombie_CrabCorpseVelocity = nil
ENT.BSZ_Zombie_CrabHealth = 20 -- remember to update this if we change the crab health
ENT.BSZ_Zombie_SpawnedFromCrab = false
-- Splitting
ENT.BSZ_Zombie_CanSplit = false
ENT.BSZ_Zombie_HasSplit = false
ENT.BSZ_Zombie_TorsoCorpseVelocity = nil
ENT.BSZ_Zombie_LegsNPC = nil
ENT.BSZ_Zombie_LegsSpawnedFromSplitting = false
-- Taunting
ENT.BSZ_Zombie_CanTaunt = true
ENT.BSZ_Zombie_TauntTime = CurTime()
ENT.BSZ_Zombie_IsTaunting = false
-- Door Breaking
ENT.BSZ_Zombie_CanBreakDoors = true
ENT.BSZ_Zombie_BreakingDoor = false
ENT.BSZ_Zombie_DoorImTryingToBreak = nil
ENT.BSZ_Zombie_NextDoorAttackCheckTime = CurTime()
-- Burning
ENT.BSZ_Zombie_PlayingBurningSound = false
ENT.BSZ_Zombie_CanPlayBurningSound = true
ENT.BSZ_Zombie_CanChangeBurningSoundVolume = true
ENT.BSZ_Zombie_BurningSound = nil
ENT.BSZ_Zombie_BurningSoundTbl = {
	"npc/zombie/moan_loop1.wav",
	"npc/zombie/moan_loop2.wav",
	"npc/zombie/moan_loop3.wav",
	"npc/zombie/moan_loop4.wav"
}
-- Technical
ENT.BSZ_Zombie_LastMeleeWasSwat = false
ENT.BSZ_Zombie_MeleeType = "Normal" -- options are Normal, Duo, Fast, and Swat
-- ENT.BSZ_Zombie_LastAttackWasForAProp = false -- this isn't used for anything
-- Stuff for NPCs that use this guy as a base
-- Crabbed
ENT.BSZ_Crabbed_Model = {
	"models/Humans/Group02/Male_01.mdl",
	"models/Humans/Group02/Male_02.mdl",
	"models/Humans/Group02/Male_03.mdl",
	"models/Humans/Group02/Male_04.mdl",
	"models/Humans/Group02/Male_05.mdl",
	"models/Humans/Group02/Male_06.mdl",
	"models/Humans/Group02/Male_07.mdl",
	"models/Humans/Group02/Male_08.mdl",
	"models/Humans/Group02/Male_09.mdl"
}
-- Astrozombie
ENT.BSZ_AstroZombie_NextJumpTime = 0
ENT.BSZ_AstroZombie_SuitDeflated = false
ENT.BSZ_AstroZombie_HelmetHealth = 50
ENT.BSZ_AstroZombie_HelmetBroken = false
--------------------
function ENT:BSZ_Zombie_CrabUnlatchEffects(spawncrab)

	if !self.BSZ_Zombie_HasCrab then return end

	self.BSZ_Zombie_HasCrab = false
	self.HasRangeAttack = false
	self:SetBodygroup(1,0)
	self:SetHitboxSet(0)
	self:RemoveAllDecals()

	if spawncrab == "Yes" || spawncrab == "YesCauseDied" then

		self.BSZ_Zombie_SpawnedCrab = ents.Create("npc_bsz_headcrab")
		self.BSZ_Zombie_SpawnedCrab:SetPos(self.BSZ_Zombie_SubType == "Torso" && self:GetPos() + self:GetUp() * 25 + self:GetForward() * 25 or self:GetPos() + self:GetUp() * 75)
		self.BSZ_Zombie_SpawnedCrab:SetLocalAngles(self:GetAngles())
		self.BSZ_Zombie_SpawnedCrab.BSZ_Headcrab_SpawnedFromZombie = true
		self.BSZ_Zombie_SpawnedCrab:Spawn()
		self.BSZ_Zombie_SpawnedCrab:Activate()
		self.BSZ_Zombie_SpawnedCrab:SetHealth(self.BSZ_Zombie_CrabHealth)

		if self:IsOnFire() then
			self.BSZ_Zombie_SpawnedCrab:Ignite(5)
		end

		self.BSZ_Zombie_SpawnedCrab:SetGroundEntity(NULL)
		self.BSZ_Zombie_SpawnedCrab:SetState(VJ_STATE_ONLY_ANIMATION)
		if spawncrab == "YesCauseDied" then
			self.BSZ_Zombie_SpawnedCrab:SetLocalVelocity(Vector(math.random(-25,25), math.random(-25,25), math.Rand(50, 75)))
		else
			self.BSZ_Zombie_SpawnedCrab:SetLocalVelocity(Vector(math.random(-75,75), math.random(-75,75), math.Rand(150, 175)))
		end
		-- self.BSZ_Zombie_SpawnedCrab:PlayAnim("drown", true, false, false)

	elseif spawncrab == "Corpse" then

		local BSZ_Zombie_CrabCorpse = ents.Create("prop_ragdoll")
		BSZ_Zombie_CrabCorpse:SetModel("models/bsz/headcrab.mdl")
		BSZ_Zombie_CrabCorpse:SetPos(self:GetAttachment(self:LookupAttachment("head")).Pos)
		BSZ_Zombie_CrabCorpse:SetAngles(self:GetAngles())
		BSZ_Zombie_CrabCorpse:Spawn()
		BSZ_Zombie_CrabCorpse:Activate()
		BSZ_Zombie_CrabCorpse:GetPhysicsObject():SetVelocity(self.BSZ_Zombie_CrabCorpseVelocity)
		BSZ_Zombie_CrabCorpse.FadeCorpseType = "FadeAndRemove"
		BSZ_Zombie_CrabCorpse.IsVJBaseCorpse = true
		BSZ_Zombie_CrabCorpse.BloodData = {Color = self.BloodColor, Particle = self.BloodParticle, Decal = self.BloodDecal}
		BSZ_Zombie_CrabCorpse:SetCollisionGroup(self.DeathCorpseCollisionType)
		if self.DeathCorpseFade then BSZ_Zombie_CrabCorpse:Fire(BSZ_Zombie_CrabCorpse.FadeCorpseType, nil, self.DeathCorpseFade) end
		if GetConVar("vj_npc_corpse_fade"):GetInt() == 1 then BSZ_Zombie_CrabCorpse:Fire(BSZ_Zombie_CrabCorpse.FadeCorpseType, nil, GetConVar("vj_npc_corpse_fadetime"):GetInt()) end

		if self:IsOnFire() then
			BSZ_Zombie_CrabCorpse:Ignite(5)
		end

		VJ.EmitSound(BSZ_Zombie_CrabCorpse, "npc/headcrab/die"..math.random(1,2)..".wav", 65, math.random(95,105))

	end

	local particle = ents.Create("info_particle_system")
	particle:SetKeyValue("effect_name", VJ.PICK(self.BloodParticle))
	particle:SetPos(self:GetAttachment(self:LookupAttachment("head")).Pos)
	particle:Spawn()
	particle:Activate()
	particle:Fire("Start")
	particle:Fire("Kill", nil, 0.1)

	VJ.EmitSound(self, "physics/body/body_medium_break"..math.random(2,4)..".wav", 80, math.random(95,105))
	VJ.EmitSound(self, "physics/flesh/flesh_squishy_impact_hard"..math.random(1,4)..".wav", 80, math.random(95,105))

	if self.BSZ_Zombie_MainType == "Crabbed" then
		self:TakeDamage(self:Health() * 2, self, self)
		timer.Simple(1, function() if IsValid(self) && !self.Dead then
			self:Dissolve()
		end end)
	end

end
--------------------
function ENT:BSZ_Zombie_Split(type)

	if self.BSZ_Zombie_HasSplit then return end

	self.BSZ_Zombie_HasSplit = true

	self.BSZ_Zombie_CanTaunt = false

	if self.BSZ_Zombie_SubType == nil then
		local particle = ents.Create("info_particle_system")
		particle:SetKeyValue("effect_name", VJ.PICK(self.BloodParticle))
		particle:SetPos(self:GetAttachment(self:LookupAttachment("maw")).Pos)
		particle:Spawn()
		particle:Activate()
		particle:Fire("Start")
		particle:Fire("Kill", nil, 0.1)
	end
	VJ.EmitSound(self, "physics/body/body_medium_break"..math.random(2,4)..".wav", 80, math.random(95,105))

	if type == "Torso" || type == "Both" then

		-- PrintMessage(4,"split triggered")
		
		self:PlaySoundSystem("Pain")

		self.JumpParams = {
			Enabled = false
		}
		self.CanFlinch = false
		self.HasMeleeAttackKnockBack = false
		self.FootstepSoundLevel = 55
		self.BSZ_Zombie_SubType = "Torso"
		self.BSZ_Zombie_CanBreakDoors = false
		if self.BSZ_Zombie_BreakingDoor then
			self.BSZ_Zombie_BreakingDoor = false
			self:SetState()
		end

		if type == "Torso" then
			local BSZ_Zombie_LegsCorpse = ents.Create("prop_ragdoll")
			BSZ_Zombie_LegsCorpse:SetModel("models/bsz/zombie_legs.mdl")
			BSZ_Zombie_LegsCorpse:SetPos(self:GetPos())
			BSZ_Zombie_LegsCorpse:SetAngles(self:GetAngles())
			BSZ_Zombie_LegsCorpse:Spawn()
			BSZ_Zombie_LegsCorpse:Activate()
			-- BSZ_Zombie_LegsCorpse:GetPhysicsObject():SetVelocity(self.BSZ_Zombie_CrabCorpseVelocity)
			BSZ_Zombie_LegsCorpse.FadeCorpseType = "FadeAndRemove"
			BSZ_Zombie_LegsCorpse.IsVJBaseCorpse = true
			BSZ_Zombie_LegsCorpse.BloodData = {Color = self.BloodColor, Particle = self.BloodParticle, Decal = self.BloodDecal}
			BSZ_Zombie_LegsCorpse:SetCollisionGroup(self.DeathCorpseCollisionType)
			if self.DeathCorpseFade then BSZ_Zombie_LegsCorpse:Fire(BSZ_Zombie_LegsCorpse.FadeCorpseType, nil, self.DeathCorpseFade) end
			if GetConVar("vj_npc_corpse_fade"):GetInt() == 1 then BSZ_Zombie_LegsCorpse:Fire(BSZ_Zombie_LegsCorpse.FadeCorpseType, nil, GetConVar("vj_npc_corpse_fadetime"):GetInt()) end

			if self:IsOnFire() then
				BSZ_Zombie_LegsCorpse:Ignite(5)
			end
		else
			self.BSZ_Zombie_LegsNPC = ents.Create("npc_bsz_zombie_legs")
			self.BSZ_Zombie_LegsNPC:SetPos(self:GetPos())
			self.BSZ_Zombie_LegsNPC:SetAngles(self:GetAngles())
			self.BSZ_Zombie_LegsNPC.BSZ_Zombie_LegsSpawnedFromSplitting = true
			self.BSZ_Zombie_LegsNPC:Spawn()
			self.BSZ_Zombie_LegsNPC:Activate()
			self.BSZ_Zombie_LegsNPC:SetHealth(self:Health() * 0.35)
			-- self:DeleteOnRemove(self.BSZ_Zombie_LegsNPC)
			if self:IsOnFire() then
				self.BSZ_Zombie_LegsNPC:Ignite(5)
			end
		end

		self:SetPos(self:GetPos() + self:GetUp() * 10)
		self:SetModel("models/bsz/zombie_torso.mdl")
		self:SetCollisionBounds(Vector(10, 10, 25), Vector(-10, -10, 0))
		self:SetSurroundingBounds(Vector(20, 20, 50), Vector(-20, -20, 0))
		self:SetHealth(self:Health() * 0.65)
		timer.Simple(0.0001, function() if IsValid(self) then
			self:SetViewOffset(Vector(0, 0, 10))
			self:SetSaveValue("m_vDefaultEyeOffset", Vector(0, 0, 10))
			self:PlayAnim("vjseq_fall", true, 1, false)
		end end)

	elseif type == "Legs" then

		self.FlinchHitGroupMap = {
			{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}},
			{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
		}
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasIdleSounds = false
		self.HasAlertSounds = false
		self.SoundTbl_BeforeMeleeAttack = false
		self.HasPainSounds = false
		self.HasDeathSounds = false
		self.SoundTbl_MeleeAttackExtra = {
			"physics/body/body_medium_impact_hard1.wav",
			"physics/body/body_medium_impact_hard2.wav",
			"physics/body/body_medium_impact_hard3.wav",
			"physics/body/body_medium_impact_hard4.wav",
			"physics/body/body_medium_impact_hard5.wav",
			"physics/body/body_medium_impact_hard6.wav"
		}
		self.BSZ_Zombie_SubType = "Legs"

		local BSZ_Zombie_TorsoCorpse = ents.Create("prop_ragdoll")
		BSZ_Zombie_TorsoCorpse:SetModel("models/bsz/zombie_torso.mdl")
		BSZ_Zombie_TorsoCorpse:SetPos(self:GetPos() + self:GetUp() * 60)
		BSZ_Zombie_TorsoCorpse:SetAngles(self:GetAngles() + Angle(45,0,0))
		BSZ_Zombie_TorsoCorpse:Spawn()
		BSZ_Zombie_TorsoCorpse:Activate()
		BSZ_Zombie_TorsoCorpse:SetSkin(self:GetSkin())
		BSZ_Zombie_TorsoCorpse:GetPhysicsObject():SetVelocity(self.BSZ_Zombie_TorsoCorpseVelocity)
		BSZ_Zombie_TorsoCorpse.FadeCorpseType = "FadeAndRemove"
		BSZ_Zombie_TorsoCorpse.IsVJBaseCorpse = true
		BSZ_Zombie_TorsoCorpse.BloodData = {Color = self.BloodColor, Particle = self.BloodParticle, Decal = self.BloodDecal}
		BSZ_Zombie_TorsoCorpse:SetCollisionGroup(self.DeathCorpseCollisionType)
		if self.DeathCorpseFade then BSZ_Zombie_TorsoCorpse:Fire(BSZ_Zombie_TorsoCorpse.FadeCorpseType, nil, self.DeathCorpseFade) end
		if GetConVar("vj_npc_corpse_fade"):GetInt() == 1 then BSZ_Zombie_TorsoCorpse:Fire(BSZ_Zombie_TorsoCorpse.FadeCorpseType, nil, GetConVar("vj_npc_corpse_fadetime"):GetInt()) end

		if self:IsOnFire() then
			BSZ_Zombie_TorsoCorpse:Ignite(5)
		end

		VJ.EmitSound(BSZ_Zombie_TorsoCorpse, self.SoundTbl_Death, self.DeathSoundLevel, math.random(self.MainSoundPitch.a,self.MainSoundPitch.b))

		self:SetPos(self:GetPos() + self:GetUp() * 10)
		self:SetHitboxSet(0)
		self:SetModel("models/bsz/zombie_legs.mdl")
		self:SetCollisionBounds(Vector(10, 10, 40), Vector(-10, -10, 0))
		self:SetSurroundingBounds(Vector(20, 20, 80), Vector(-20, -20, 0))
		self:SetHealth(self:Health() * 0.35)
		timer.Simple(0.0001, function() if IsValid(self) then
			self:SetViewOffset(Vector(0, 0, 30))
			self:SetSaveValue("m_vDefaultEyeOffset", Vector(0, 0, 10))
		end end)

		if self.BSZ_Zombie_HasCrab then

			self.HasRangeAttack = false
			self.BSZ_Zombie_HasCrab = false
			-- BSZ_Zombie_TorsoCorpse:SetBodygroup(1,1)

			self.BSZ_Zombie_SpawnedCrab = ents.Create("npc_bsz_headcrab")
			self.BSZ_Zombie_SpawnedCrab:SetPos(self:GetPos() + self:GetUp() * 75)
			self.BSZ_Zombie_SpawnedCrab:SetLocalAngles(self:GetAngles())
			self.BSZ_Zombie_SpawnedCrab.BSZ_Headcrab_SpawnedFromZombie = true
			self.BSZ_Zombie_SpawnedCrab:Spawn()
			self.BSZ_Zombie_SpawnedCrab:Activate()

			self.BSZ_Zombie_SpawnedCrab:SetGroundEntity(NULL)
			self.BSZ_Zombie_SpawnedCrab:SetState(VJ_STATE_ONLY_ANIMATION)
			self.BSZ_Zombie_SpawnedCrab:SetLocalVelocity(Vector(math.random(-50,50), math.random(-50,50), math.Rand(100, 125)))
			self.BSZ_Zombie_SpawnedCrab:PlayAnim("drown", true, false, false)

		end

	end

end
--------------------
function ENT:BSZ_Zombie_CustomOnInit()

	self:SetSkin(math.random(0,1))

	if self.BSZ_Zombie_SubType != "Legs" && (self.BSZ_Zombie_SpawnedFromCrab or math.random(1,3) == 1) then

		self.BSZ_Zombie_HasCrab = true
		self.HasRangeAttack = true
		self.AnimTbl_RangeAttack = "vjseq_releasecrab"
		self.RangeAttackAnimationFaceEnemy = false
		self.RangeAttackMinDistance = 0
		self.RangeAttackMaxDistance = 300
		self.TimeUntilRangeAttackProjectileRelease = false
		self:SetBodygroup(1,1)
		self:SetHitboxSet(1)

	end

	if self.BSZ_Zombie_TypeVariant == "GoreBlaster" then
		self:ManipulateBoneScale(9, Vector(1,1.25,1.25))
		self:ManipulateBoneScale(10, Vector(1,1.25,1.25))
	end

	-- if !self.BSZ_Zombie_SpawnedFromCrab then
		if GetConVar("bsz_spawnintros"):GetInt() == 1 then
			self:BSZ_DoSpawnSequence()
		else
			local ed = EffectData()
			ed:SetEntity( self )
			util.Effect( "propspawn", ed, true, true )
		end
	-- else
		-- timer.Simple(0.0001, function() if IsValid(self) then
			-- self:PlayAnim("vjseq_crabbed", true, 1, false)
			-- ParticleEffect("blood_impact_red_01", self:GetAttachment(self:LookupAttachment("headcrab")).Pos, self:GetAngles(), self)
			-- self:PlaySoundSystem("Pain")
		-- end end)
	-- end

	if self.BSZ_Zombie_SubType != nil or self.BSZ_Zombie_TypeVariant == "GoreBlaster" then return end

	if math.random(1,3) == 1 then
		self.BSZ_Zombie_CanSplit = true
	end

end
--------------------
function ENT:BSZ_DoSpawnSequence()

	local ZombSpawnSprite = ents.Create("env_sprite")
	ZombSpawnSprite:SetKeyValue("model","sprites/flare1.vmt")
	if self.BSZ_Zombie_SubType == "Torso" then
		ZombSpawnSprite:SetPos(self:GetPos() + self:GetUp() * -10)
	else
		ZombSpawnSprite:SetPos(self:GetPos())
	end
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
			ZombSpawnSpriteSize = ZombSpawnSpriteSize + 0.015
			-- ZombSpawnSpriteBlueness = ZombSpawnSpriteBlueness + 2.3
			ZombSpawnSpriteGreenness = ZombSpawnSpriteGreenness + 2
			ZombSpawnLightDistance = ZombSpawnLightDistance + 1.25
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

	VJ.EmitSound(self, "ambient/levels/labs/teleport_preblast_suckin1.wav", 75, math.random(95,105))

	for i=1,4 do
		timer.Simple(0.5*i, function() if IsValid(self) then
			local effectBlood = EffectData()
			effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
			util.Effect("bsz_zombiegas", effectBlood)
		end end)
	end

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

			-- local effectBlood = EffectData()
			-- effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
			-- util.Effect("bsz_zombiegas", effectBlood)

			local colorcyan = Color(0, 225, 0, 155)
			effects.BeamRingPoint(self:GetPos() + self:OBBCenter() + self:GetUp() * 20, 1, 0, 50, 2.5, 0, colorcyan)
			effects.BeamRingPoint(self:GetPos() + self:OBBCenter(), 1, 0, 50, 2.5, 0, colorcyan)
			effects.BeamRingPoint(self:GetPos() + self:OBBCenter() + self:GetUp() * -20, 1, 0, 50, 2.5, 0, colorcyan)

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
function ENT:BSZ_AttackDoor()

	if !IsValid(self.BSZ_Zombie_DoorImTryingToBreak) then return end

	VJ.EmitSound(self.BSZ_Zombie_DoorImTryingToBreak, "physics/wood/wood_panel_impact_hard1.wav", 75, math.random(95,105))

	if self.BSZ_Zombie_DoorImTryingToBreak.bbohgdoorhp == nil then
		self.BSZ_Zombie_DoorImTryingToBreak.bbohgdoorhp = 200 - self.BSZ_Zombie_MeleeDamage_Weak
	elseif self.BSZ_Zombie_DoorImTryingToBreak.bbohgdoorhp <= 0 then
		return
	else
		self.BSZ_Zombie_DoorImTryingToBreak.bbohgdoorhp = self.BSZ_Zombie_DoorImTryingToBreak.bbohgdoorhp - self.BSZ_Zombie_MeleeDamage_Weak
	end

	if self.BSZ_Zombie_DoorImTryingToBreak.bbohgdoorhp <= 0 then

		VJ.EmitSound(self.BSZ_Zombie_DoorImTryingToBreak, "ambient/materials/door_hit1.wav", 80, math.random(95,105))

		ParticleEffect("door_pound_core", self.BSZ_Zombie_DoorImTryingToBreak:GetPos(), self.BSZ_Zombie_DoorImTryingToBreak:GetAngles())
		ParticleEffect("door_explosion_chunks", self.BSZ_Zombie_DoorImTryingToBreak:GetPos(), self.BSZ_Zombie_DoorImTryingToBreak:GetAngles())

		self.BSZ_Zombie_DoorImTryingToBreak:Fire("Unlock")
		self.BSZ_Zombie_DoorImTryingToBreak:Fire("Open")
		self.BSZ_Zombie_DoorImTryingToBreak:Use(self, self, USE_ON, 0)
		self.BSZ_Zombie_DoorImTryingToBreak:Remove()

		local doorgib = ents.Create("prop_physics")
		doorgib:SetPos(self.BSZ_Zombie_DoorImTryingToBreak:GetPos())
		doorgib:SetAngles(self.BSZ_Zombie_DoorImTryingToBreak:GetAngles())
		doorgib:SetModel(self.BSZ_Zombie_DoorImTryingToBreak:GetModel())
		doorgib:SetSkin(self.BSZ_Zombie_DoorImTryingToBreak:GetSkin())
		doorgib:SetBodygroup(1, self.BSZ_Zombie_DoorImTryingToBreak:GetBodygroup(1))
		doorgib:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		doorgib:SetSolid(SOLID_NONE)
		doorgib:Spawn()
		doorgib:GetPhysicsObject():ApplyForceCenter(self:GetForward() * 1000)

		timer.Simple(10, function() if IsValid(doorgib) then
			doorgib:Dissolve()
		end end)

	end

end
--------------------
function ENT:BSZ_CustomOnPreDamaged(dmginfo, hitgroup, status)
	if self.BSZ_Zombie_MainType != "Classic" then return end
	if hitgroup == HITGROUP_HEAD && self.BSZ_Zombie_HasCrab then
		self.BSZ_Zombie_CrabHealth = self.BSZ_Zombie_CrabHealth - dmginfo:GetDamage()
		dmginfo:ScaleDamage(0.75)
	end
end
--------------------
function ENT:BSZ_CustomOnPostDamaged(dmginfo, hitgroup, status)
	if self.BSZ_Zombie_MainType != "Classic" then return end
	if hitgroup == HITGROUP_HEAD && self.BSZ_Zombie_HasCrab then
		-- PrintMessage(4,""..self.BSZ_Zombie_CrabHealth.."")
		if self.BSZ_Zombie_CrabHealth <= 0 then
			self.NextFlinchT = CurTime() - 10
			-- self.BSZ_Zombie_CrabCorpseVelocity = dmginfo:GetDamageForce() * 5
			self.BSZ_Zombie_CrabCorpseVelocity = dmginfo:GetDamageForce()
			self:BSZ_Zombie_CrabUnlatchEffects("Corpse")
			self.BSZ_Zombie_CrabCorpseVelocity = nil
		end	
	elseif
		self.BSZ_Zombie_CanSplit &&
		!self.BSZ_Zombie_HasSplit &&
		(
			dmginfo:GetDamageType() == (DMG_BLAST or DMG_BLAST_SURFACE or DMG_MISSILEDEFENCE) &&
			math.random(1,5) == 1
		or
			dmginfo:IsBulletDamage() &&
			math.random(1,15) == 1
		)
	then	
		if (hitgroup == HITGROUP_CHEST || hitgroup == HITGROUP_HEAD || hitgroup == HITGROUP_LEFTARM || hitgroup == HITGROUP_RIGHTARM) then
			-- PrintMessage(4,"test")
			self.BSZ_Zombie_TorsoCorpseVelocity = dmginfo:GetDamageForce()
			self:BSZ_Zombie_Split("Legs")
			self.BSZ_Zombie_TorsoCorpseVelocity = nil
		elseif hitgroup == HITGROUP_LEFTLEG || hitgroup == HITGROUP_RIGHTLEG then
			self:BSZ_Zombie_Split("Torso")
		else
			local splittypemathrandom = math.random(1,3)
			if splittypemathrandom == 1 then
				self:BSZ_Zombie_Split("Torso")
			elseif splittypemathrandom == 2 then
				self.BSZ_Zombie_TorsoCorpseVelocity = dmginfo:GetDamageForce()
				self:BSZ_Zombie_Split("Legs")
				self.BSZ_Zombie_TorsoCorpseVelocity = nil
			else
				self:BSZ_Zombie_Split("Both")
			end
		end
	end
end
--------------------
function ENT:Init()

	-- if GetConVar("bbohgg_nogodsnomasters"):GetInt() == 1 then
		-- self.VJ_NPC_Class = {"CLASS_BBOHG"}
	-- end

	self:BSZ_Zombie_CustomOnInit()

	-- if GetConVar("bbohgg_spawnsequences"):GetInt() == 1 && !self.BSZ_Zombie_SpawnedFromCrab then
		-- self:SetNoDraw(true)
		-- self.CanInvestigate = false 
		-- timer.Simple(0.11, function() if IsValid(self) then
			-- self:PlayAnim("vjseq_spawn_b", true, 3.55, false)
		-- end end)
		-- replace this with an animation event
		-- timer.Simple(5, function() if IsValid(self) then
			-- self.CanInvestigate = true
		-- end end)
	-- end

end
--------------------
function ENT:OnThinkActive()

	if !IsValid(self.BSZ_Zombie_DoorImTryingToBreak) && self.BSZ_Zombie_CanBreakDoors then
		if !self.BSZ_Zombie_BreakingDoor then
			for _, v in pairs(ents.FindInSphere(self:GetPos(), 30)) do
				if v:GetClass() == "prop_door_rotating" && self:Visible(v) then
					self.BSZ_Zombie_BreakingDoor = true
					self.BSZ_Zombie_DoorImTryingToBreak = v
				end
			end
		elseif self.BSZ_Zombie_BreakingDoor then
			self.BSZ_Zombie_BreakingDoor = false
			self:SetState()
		end
	elseif
		IsValid(self.BSZ_Zombie_DoorImTryingToBreak) &&
		self.BSZ_Zombie_BreakingDoor &&
		self.BSZ_Zombie_NextDoorAttackCheckTime < CurTime() &&
		(
			self.BSZ_Zombie_SubType == "Legs" && self:GetSequenceName(self:GetSequence()) != "kickdoor"
		or
			self:GetSequenceName(self:GetSequence()) != "WallPound"
		)
		then
		self.BSZ_Zombie_NextDoorAttackCheckTime = CurTime() + 1
		self:SetTurnTarget(self.BSZ_Zombie_DoorImTryingToBreak)
		self:SetState(VJ_STATE_ONLY_ANIMATION_NOATTACK)
		if self.BSZ_Zombie_SubType == "Legs" then
			self:PlayAnim("vjseq_kickdoor", true, 1, false)
		else
			self:PlayAnim("vjseq_WallPound", true, false, false)
		end
	end

	if IsValid(self:GetEnemy()) && !self:IsBusy() then 
		if self.BSZ_Zombie_CanTaunt && self.BSZ_Zombie_TauntTime < CurTime() then
			self.BSZ_Zombie_TauntTime = CurTime() + math.random(5,30)
			self.BSZ_Zombie_IsTaunting = true
			self:PlaySoundSystem("Alert")
			self:PlayAnim("vjges_taunt_zombie", "LetAttacks", 3)
			self.IsAbleToMeleeAttack = false
			self.IsAbleToRangeAttack = false
			timer.Simple(3, function() if IsValid(self) then
				self.IsAbleToMeleeAttack = true
				self.IsAbleToRangeAttack = true
				self.BSZ_Zombie_IsTaunting = false
			end end)
		elseif /*self.BSZ_Zombie_MainType == "Classic" &&*/ self.BSZ_Zombie_SubType == nil && self:IsUnreachable(self:GetEnemy()) && math.random(1,100) == 1 then
			self:PlayAnim("vjseq_tantrum", "LetAttacks", 1)
		end
	end

	if !self.BSZ_Zombie_PlayingBurningSound && self:IsOnFire() && self.BSZ_Zombie_CanPlayBurningSound then
		self.BSZ_Zombie_PlayingBurningSound = true
		self.HasPainSounds = false
		self.BSZ_Zombie_BurningSound = CreateSound(self, VJ.PICK(self.BSZ_Zombie_BurningSoundTbl))
		self.BSZ_Zombie_BurningSound:SetSoundLevel(self.PainSoundLevel)
		self.BSZ_Zombie_BurningSound:Play()
		self.BSZ_Zombie_BurningSound:ChangeVolume(0.2, 0)
		self.BSZ_Zombie_BurningSound:ChangeVolume(1, 2.5)
		self.BSZ_Zombie_BurningSound:ChangePitch(math.random(self.MainSoundPitch.a,self.MainSoundPitch.b), 2.5)
	elseif self.BSZ_Zombie_PlayingBurningSound && !self:IsOnFire() then
		self.BSZ_Zombie_PlayingBurningSound = false
		self.BSZ_Zombie_CanPlayBurningSound = false
		self.BSZ_Zombie_CanChangeBurningSoundVolume = false
		self.BSZ_Zombie_BurningSound:ChangeVolume(0, 0.5)
		timer.Simple(0.5, function() if IsValid(self) then
			self.BSZ_Zombie_BurningSound:Stop()
			self.BSZ_Zombie_CanPlayBurningSound = true
			self.BSZ_Zombie_CanChangeBurningSoundVolume = true
		end end)
	end

end
--------------------
function ENT:OnInput(key, activator, caller, data)

	if key == "step" then

		if self:WaterLevel() > 0 then
			if self:WaterLevel() == 1 then
				self:PlayFootstepSound("player/footsteps/slosh"..math.random(1,4)..".wav")
			elseif self:WaterLevel() >= 2 then
				self:PlayFootstepSound("player/footsteps/wade"..math.random(5,8)..".wav")
			end
		else
			self:PlayFootstepSound()
		end

	elseif key == "scuff" && self:WaterLevel() == 0 then

		VJ.EmitSound(self, "npc/zombie/foot_slide"..math.random(1,3)..".wav", 60, math.random(95,105))

	elseif key == "drag" then

		self:PlayFootstepSound()
		VJ.EmitSound(self, "npc/zombie/foot_slide"..math.random(1,3)..".wav", 60, math.random(95,105))
		-- place blood decal below itself

	elseif key == "attack" || key == "attack_duo" || key == "attack_fast" || key == "attack_swat" then

		if key == "attack_swat" then

			if !self.BSZ_Zombie_LastMeleeWasSwat then

				self.BSZ_Zombie_LastMeleeWasSwat = true
				self.BSZ_Zombie_MeleeType = "Swat"
				self.MeleeAttackDamage = self.BSZ_Zombie_MeleeDamage_Weak
				self.SoundTbl_MeleeAttackExtra = "npc/zombie/zombie_hit.wav"
				if self.BSZ_Zombie_MainType == "Classic" then
					self.MeleeAttackDamageType = DMG_CLUB
				end

			end

		else

			if self.BSZ_Zombie_LastMeleeWasSwat then

				self.BSZ_Zombie_LastMeleeWasSwat = false

				if self.BSZ_Zombie_MainType != "Classic" then
					self.SoundTbl_MeleeAttackExtra = {
						"npc/infected/hit/hit_punch_01.wav",
						"npc/infected/hit/hit_punch_02.wav",
						"npc/infected/hit/hit_punch_03.wav",
						"npc/infected/hit/hit_punch_04.wav",
						"npc/infected/hit/hit_punch_05.wav",
						"npc/infected/hit/hit_punch_06.wav",
						"npc/infected/hit/hit_punch_07.wav",
						"npc/infected/hit/hit_punch_08.wav"
					}
				else
					self.MeleeAttackDamageType = DMG_SLASH
					self.SoundTbl_MeleeAttackExtra = "Zombie.AttackHit"
				end

			end

			if key == "attack" && self.BSZ_Zombie_SubType == nil then

				self.BSZ_Zombie_MeleeType = "Normal"
				self.MeleeAttackDamage = self.BSZ_Zombie_MeleeDamage

			elseif key == "attack_duo" then

				self.BSZ_Zombie_MeleeType = "Duo"
				self.MeleeAttackDamage = self.BSZ_Zombie_MeleeDamage_Duo

			elseif key == "attack_fast" then

				self.BSZ_Zombie_MeleeType = "Fast"
				self.MeleeAttackDamage = self.BSZ_Zombie_MeleeDamage_Weak

			end

		end

		self:ExecuteMeleeAttack()

	elseif key == "attack_ranged" then

		self:ExecuteRangeAttack()

	elseif key == "releasecrab" then

		self:BSZ_Zombie_CrabUnlatchEffects("Yes")

	elseif key == "body" then

		VJ.EmitSound(self, "physics/body/body_medium_impact_hard"..math.random(1,6)..".wav", 70, math.random(95,105))

	elseif key == "torsofall" then

		VJ.EmitSound(self, "physics/flesh/flesh_impact_hard"..math.random(1,6)..".wav", 70, math.random(95,105))
		VJ.EmitSound(self, "physics/flesh/flesh_squishy_impact_hard"..math.random(1,4)..".wav", 70, math.random(95,105))

	elseif key == "fall_land" then

		self:PlaySoundSystem("Pain")
		VJ.EmitSound(self, "physics/body/body_medium_impact_hard"..math.random(1,6)..".wav", 70, math.random(95,105))
		if self:GetClass() != "npc_bsz_astrozomb" then
			VJ.EmitSound(self, "physics/flesh/flesh_impact_hard"..math.random(1,6)..".wav", 70, math.random(95,105))
			VJ.EmitSound(self, "physics/flesh/flesh_squishy_impact_hard"..math.random(1,4)..".wav", 70, math.random(95,105))
		end

		if self.BSZ_Zombie_TypeVariant == "GoreBlaster" then
			self:SetHealth(self:Health() - 10)
			if self:Health() <= 0 then
				self:TakeDamage(100)
			end
		end

	elseif key == "doorpound" then

		self:BSZ_AttackDoor()

	-- elseif key == "spawn_unhide" then

		-- clean this up
		-- self:SetNoDraw(false)
		-- VJ.EmitSound(self, "bbohg/fx/zombies/dirtintro"..math.random(1,2)..".ogg", 70, math.random(95,105))
		-- ParticleEffect("rock_splinter_stalactite", self:GetPos(), self:GetAngles(), self)
		-- ParticleEffect("strider_impale_ground", self:GetPos(), self:GetAngles(), self)
		-- ParticleEffect("advisor_pillar1_break", self:GetPos(), self:GetAngles(), self)
		-- ParticleEffect("advisor_healthcharger_break", self:GetPos() + self:GetUp() * 15 + Vector(0,15,0), Angle(0,0,0), self)
		-- ParticleEffect("advisor_healthcharger_break", self:GetPos() + self:GetUp() * 15 + Vector(0,-15,0), Angle(0,0,0), self)

		-- ParticleEffect("tank_rock_throw_ground_generic_cracks_2", self:GetPos(), self:GetAngles(), self) -- reconsider after adding these to the addon itself
		-- ParticleEffect("advisor_healthcharger_break", self:GetPos() + self:GetUp() * 35, self:GetAngles(), self)

		-- for i = 1,15 do
			-- timer.Simple(0.35 * i, function() if IsValid(self) then
				-- ParticleEffect("strider_headbeating_01", self:GetPos(), self:GetAngles(), self)
			-- end end)
		-- end

		-- for i=1,15 do
			-- timer.Simple(0.35*i, function() if IsValid(self) then
				-- ParticleEffect("advisor_healthcharger_break", self:GetPos() + self:GetUp() * 25 + Vector(0,15,0), Angle(0,0,0), self)
				-- ParticleEffect("advisor_healthcharger_break", self:GetPos() + self:GetUp() * 25 + Vector(0,-15,0), Angle(0,0,0), self)

				-- ParticleEffect("advisor_pillar1_break", self:GetPos() + self:GetUp() * -40, Angle(0,0,0), self)
				-- ParticleEffect("hunter_slide_dust", self:GetPos() + self:GetUp() * 5, Angle(0,0,0), self)
			-- end end)
		-- end

		-- local effectBlood = EffectData()
		-- effectBlood:SetOrigin(self:GetPos())
		-- effectBlood:SetColor(VJ_Color2Byte(Color(133,133,133)))
		-- effectBlood:SetScale(100)
		-- util.Effect("VJ_Blood1",effectBlood)

	end

end
--------------------
function ENT:OnAlert()
	if self.BSZ_Zombie_CanTaunt then
		self.BSZ_Zombie_TauntTime = CurTime() + math.random(5,30)
	end
end
--------------------
function ENT:OnMeleeAttack(status, enemy)
	if (self.BSZ_Zombie_IsTaunting or self:IsBusy()) && status == "PreInit" then return true end
	if status == "Init" then
		if self.BSZ_Zombie_SubType == nil && self.MeleeAttack_IsPropAttack then
			self.AnimTbl_MeleeAttack = {"vjseq_swatleftlow", "vjseq_swatrightlow"}
			timer.Simple(0.1, function() if IsValid(self) then
				self.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
			end end)
		end
		if self.BSZ_Zombie_PlayingBurningSound && self.BSZ_Zombie_CanChangeBurningSoundVolume then
			self.BSZ_Zombie_BurningSound:ChangeVolume(0, 0.5)
			timer.Simple(0.5, function() if IsValid(self) && self.BSZ_Zombie_CanChangeBurningSoundVolume then
				self.BSZ_Zombie_BurningSound:ChangeVolume(1, 1)
			end end)
		end
	end
end
--------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	if self.BSZ_Zombie_SubType == nil then
		if self.BSZ_Zombie_MeleeType == "Swat" then
			return self:GetForward() * math.random(125, 150) + self:GetUp() * 100
		elseif self.BSZ_Zombie_MeleeType == "Duo" then
			return self:GetForward() * math.random(135, 140) + self:GetUp() * 10
		elseif self.BSZ_Zombie_MeleeType == "Fast" then
			return self:GetForward() * math.random(75, 100) + self:GetUp() * 10
		else
			return self:GetForward() * math.random(100, 140) + self:GetUp() * 10
		end
	elseif self.BSZ_Zombie_SubType == "Legs" then
		return self:GetForward() * math.random(125, 150) + self:GetUp() * 75
	end
end
--------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "PreDamage" && self:IsOnFire() then
		ent:Ignite(3)
	end
end
--------------------
function ENT:OnRangeAttack(status, enemy)
	if (self.BSZ_Zombie_IsTaunting or self:IsBusy()) && status == "PreInit" then return true end
	-- PrintMessage(3,"range attack attempted")
	if self:GetClass() != "npc_bsz_zombie" then return end
	if status == "PreInit" then
		if (self:Health() <= (self:GetMaxHealth() * 0.5) && math.random(1,3) != 1) or math.random(1,6) != 1 then
			self.IsAbleToRangeAttack = false
			timer.Simple(3, function() if IsValid(self) then
				self.IsAbleToRangeAttack = true
			end end)
			return true
		end
	elseif status == "PostInit" then
		if self.CanFlinch then
			self.CanFlinch = false
			timer.Simple(2, function() if IsValid(self) then
				self.CanFlinch = true
			end end)
		end
	end
end
--------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" then
		self:BSZ_CustomOnPreDamaged(dmginfo, hitgroup, status)
	elseif status == "PostDamage" then
		self:BSZ_CustomOnPostDamaged(dmginfo, hitgroup, status)
		if
			(
				dmginfo:GetInflictor():GetClass() == "env_fire" or
				dmginfo:GetInflictor():GetClass() == "entityflame" or
				(
					dmginfo:GetInflictor():GetClass() == "trigger_hurt" &&
					dmginfo:GetDamageType() == (DMG_BURN or DMG_SLOWBURN)
				)
			)
		then
			if !self:IsOnFire() then
				self:Ignite(10)
			end
			self.Bleeds = false
			timer.Simple(0.0001,function() if IsValid(self) then
				self.Bleeds = true
			end end)
			if self.HasImpactSounds then
				self.HasImpactSounds = false
				timer.Simple(0.001,function() if IsValid(self) then
					self.HasImpactSounds = true
				end end)
			end
		end
	end
end
--------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)

	if
		dmginfo:GetDamageType() != (DMG_BLAST or DMG_BLAST_SURFACE or DMG_MISSILEDEFENCE)
		or
		dmginfo:GetDamageType() == (DMG_BLAST or DMG_BLAST_SURFACE or DMG_MISSILEDEFENCE) && dmginfo:GetDamage() <= self:GetMaxHealth() * 0.5
	then
		return false
	end

	self.HasDeathSounds = false

	if self.HasGibOnDeathEffects then

		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		util.Effect("bsz_gibbed_zombie",effectBlood)
		effectBlood:SetColor(VJ_Color2Byte(Color(127,0,0)))
		if self.BSZ_Zombie_SubType != nil then
			effectBlood:SetScale(75)
		else
			effectBlood:SetScale(100)
		end
		util.Effect("VJ_Blood1",effectBlood)

		ParticleEffect("blood_impact_red_01", self:GetPos() + self:OBBCenter(), self:GetAngles(), self)
		ParticleEffect("blood_impact_red_01", self:GetPos() + self:OBBCenter(), self:GetAngles(), self)

	end

	if self.BSZ_Zombie_SubType != nil then
		for i = 1, math.random(3,5) do
			if math.random(1,3) == 1 then
				self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos = self:GetPos() + self:OBBCenter(), CollisionDecal = "Blood"})
			else
				self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos = self:GetPos() + self:OBBCenter(), CollisionDecal = "Blood"})
			end
		end
	else
		for i = 1, math.random(6,10) do
			if math.random(1,3) == 1 then
				self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos = self:GetPos() + self:OBBCenter(), CollisionDecal = "Blood"})
			else
				self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos = self:GetPos() + self:OBBCenter(), CollisionDecal = "Blood"})
			end
		end
	end

	if self.BSZ_Zombie_HasCrab then
		self.BSZ_Zombie_HasCrab = false
		if self.HasGibOnDeathEffects then
			local effectBlood = EffectData()
			effectBlood:SetOrigin(self:GetAttachment(self:LookupAttachment("headcrab")).Pos)
			util.Effect("bsz_gibbed_headcrab", effectBlood)

			ParticleEffect("blood_impact_yellow_01", self:GetAttachment(self:LookupAttachment("headcrab")).Pos, self:GetAngles(), self)
			ParticleEffect("blood_impact_yellow_01", self:GetAttachment(self:LookupAttachment("headcrab")).Pos, self:GetAngles(), self)
		end
		for i = 1, math.random(3,5) do
			self:CreateGibEntity("obj_vj_gib", "UseAlien_Small", {Pos = self:GetAttachment(self:LookupAttachment("headcrab")).Pos})
		end
	end

	self:PlaySoundSystem("Gib", "physics/flesh/flesh_bloody_break.wav")

	return true, {AllowSound = false}
end
--------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Finish" && self.BSZ_Zombie_HasCrab then
		self:BSZ_Zombie_CrabUnlatchEffects("YesCauseDied")
	end
end
--------------------
function ENT:CustomOnRemove()
	if self.BSZ_Zombie_PlayingBurningSound then
		self.BSZ_Zombie_BurningSound:Stop()
	end
end
--------------------
function ENT:TranslateActivity(act)
	if self.BSZ_Zombie_SubType == nil then
		if act == ACT_RUN then
			if self.EnemyData.Distance <= 500 then
				if self:IsOnFire() then
					if self.BSZ_Zombie_MainType == "Charred" then
						return ACT_RUN
					else
						return ACT_RUN_ON_FIRE
					end
				else
					return ACT_WALK_AIM
				end
			else
				if self:IsOnFire() then
					if self.BSZ_Zombie_MainType == "Charred" then
						return ACT_WALK_AIM
					else
						return ACT_WALK_ON_FIRE
					end
				else
					return ACT_WALK
				end
			end
		elseif act == ACT_IDLE then
			if self:IsOnFire() then
				return ACT_IDLE_ON_FIRE
			end
		end
	elseif self.BSZ_Zombie_SubType != nil then
		if act == ACT_RUN then
			if self.EnemyData.Distance <= 500 then
				return ACT_WALK_AIM
			else
				return ACT_WALK
			end
		end
	end
	return act
end