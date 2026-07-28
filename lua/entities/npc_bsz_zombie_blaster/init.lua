include("entities/npc_bsz_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/goreblaster.mdl"
ENT.StartHealth = 75
--------------------
ENT.DeathCorpseModel = "models/bsz/zombie_legs.mdl"
--------------------
ENT.HasDeathSounds = false
ENT.MainSoundPitch = VJ.SET(85, 95)
--------------------
ENT.BSZ_Zombie_TypeVariant = "GoreBlaster"
--------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Finish" then

		for i=1,math.random(6,8) do
			local deathflesh = ents.Create("obj_bsz_flesh")
			deathflesh:SetPos(self:GetAttachment(self:LookupAttachment("maw")).Pos)
			deathflesh:SetAngles(Angle(math.random(0,360),math.random(0,360),math.random(0,360)))
			deathflesh:SetOwner(self)
			deathflesh:Spawn()
			deathflesh:Activate()
			if IsValid(deathflesh:GetPhysicsObject()) then
				deathflesh:GetPhysicsObject():SetVelocity(Vector(math.random(-250,250), math.random(-250,250), math.random(125,350)))
			end
		end

		for i=1,math.random(12,16) do
			local deathflesh = ents.Create("obj_bsz_rib")
			deathflesh:SetPos(self:GetAttachment(self:LookupAttachment("chest")).Pos)
			deathflesh:SetAngles(Angle(math.random(0,360),math.random(0,360),math.random(0,360)))
			deathflesh:SetOwner(self)
			deathflesh:Spawn()
			deathflesh:Activate()
			if IsValid(deathflesh:GetPhysicsObject()) then
				deathflesh:GetPhysicsObject():SetVelocity(Vector(math.random(-750,750), math.random(-750,750), math.random(-50,275)))
			end
		end

		for i=1,math.random(4,6) do
			local deathflesh = ents.Create("obj_bsz_rib")
			deathflesh:SetPos(self:GetAttachment(self:LookupAttachment("chest")).Pos)
			deathflesh:SetAngles(Angle(math.random(0,360),math.random(0,360),math.random(0,360)))
			deathflesh:SetOwner(self)
			deathflesh:Spawn()
			deathflesh:Activate()
			if IsValid(deathflesh:GetPhysicsObject()) then
				deathflesh:GetPhysicsObject():SetVelocity(self:GetForward() * math.random(500, 1000) + self:GetRight() * math.random(-250, 250) + self:GetUp() * math.random(-50, 150))
			end
		end

		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter() + self:GetUp() * 10)
		util.Effect("bsz_goreblasterexplosion", effectBlood)
		effectBlood:SetColor(VJ_Color2Byte(Color(80,0,0)))
		effectBlood:SetScale(100)
		util.Effect("VJ_Blood1", effectBlood)

		util.ScreenShake(self:GetPos() + self:OBBCenter(), 25, 40, 1, 350)

		VJ.EmitSound(self, {
			"player/boomer/explode/explo_medium_09.wav",
			"player/boomer/explode/explo_medium_10.wav",
			"player/boomer/explode/explo_medium_14.wav"
		}, 85, math.random(105,125))

		VJ.ApplyRadiusDamage(self, self, self:GetPos() + self:OBBCenter(), 100, 25)

		if self.BSZ_Zombie_HasCrab then

			self.BSZ_Zombie_SpawnedCrab = ents.Create("npc_bsz_headcrab")
			self.BSZ_Zombie_SpawnedCrab:SetPos(self:GetAttachment(self:LookupAttachment("head")).Pos)
			self.BSZ_Zombie_SpawnedCrab:SetLocalAngles(self:GetAngles())
			self.BSZ_Zombie_SpawnedCrab.BSZ_Headcrab_SpawnedFromZombie = true
			self.BSZ_Zombie_SpawnedCrab:Spawn()
			self.BSZ_Zombie_SpawnedCrab:Activate()

			self.BSZ_Zombie_SpawnedCrab:SetGroundEntity(NULL)
			self.BSZ_Zombie_SpawnedCrab:SetState(VJ_STATE_ONLY_ANIMATION)
			self.BSZ_Zombie_SpawnedCrab:SetLocalVelocity(Vector(math.random(-10,10), math.random(-10,10), math.random(500, 625)))
			-- self.BSZ_Zombie_SpawnedCrab:PlayAnim("drown", true, false, false)

		end

	end
end