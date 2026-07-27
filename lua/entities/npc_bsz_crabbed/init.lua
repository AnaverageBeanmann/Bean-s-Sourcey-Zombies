include("entities/npc_bsz_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/crabbed.mdl"
ENT.StartHealth = 75
--------------------
ENT.MeleeAttackDamageType = DMG_CLUB
--------------------
ENT.SoundTbl_MeleeAttackExtra = {
	"npc/infected/hit/hit_punch_01.wav",
	"npc/infected/hit/hit_punch_02.wav",
	"npc/infected/hit/hit_punch_03.wav",
	"npc/infected/hit/hit_punch_04.wav",
	"npc/infected/hit/hit_punch_05.wav",
	"npc/infected/hit/hit_punch_06.wav",
	"npc/infected/hit/hit_punch_07.wav",
	"npc/infected/hit/hit_punch_08.wav"
}
--------------------
ENT.BSZ_Zombie_MainType = "Crabbed"
ENT.BSZ_Zombie_MeleeDamage = 10
ENT.BSZ_Zombie_MeleeDamage_Duo = 15
ENT.BSZ_Zombie_MeleeDamage_Weak = 5
--------------------
function ENT:BSZ_Zombie_CustomOnInit()

	self.BSZ_Zombie_HasCrab = true

	local bodmod = ents.Create("bsz_bonemerge")
	bodmod:SetPos(self:GetPos())
	bodmod:SetAngles(self:GetAngles())
	bodmod:SetParent(self)
	bodmod:SetOwner(self)

	if !self.BSZ_Zombie_SpawnedFromCrab then
		bodmod:SetModel(VJ.PICK(self.BSZ_Crabbed_Model))
		bodmod:Spawn()
		self.DeathCorpseModel = bodmod:GetModel()
		bodmod:ManipulateBoneScale(bodmod:LookupBone("ValveBiped.Bip01_Head1"), Vector(0, 0, 0))
		if GetConVar("bsz_spawnintros"):GetInt() == 1 then
			self:BSZ_DoSpawnSequence()
			bodmod:SetNoDraw(true)
			timer.Simple(2.3, function() if IsValid(self) then
				bodmod:SetNoDraw(false)
				local ed = EffectData()
				ed:SetEntity( bodmod )
				util.Effect( "propspawn", ed, true, true )
			end end)
		else
			local ed = EffectData()
			ed:SetEntity( self )
			util.Effect( "propspawn", ed, true, true )
			ed:SetEntity( bodmod )
			util.Effect( "propspawn", ed, true, true )
		end
	else
		bodmod:SetModel(self.BSZ_Crabbed_Model)
		bodmod:Spawn()
		self.DeathCorpseModel = self.BSZ_Crabbed_Model
		timer.Simple(0.0001, function() if IsValid(self) then
			self:PlayAnim("vjseq_crabbed", true, 1, false)
			ParticleEffect("blood_impact_red_01", self:GetAttachment(self:LookupAttachment("headcrab")).Pos, self:GetAngles(), self)
			self:PlaySoundSystem("Pain")
		end end)
		timer.Simple(0.75, function() if IsValid(self) then
			bodmod:ManipulateBoneScale(bodmod:LookupBone("ValveBiped.Bip01_Head1"), Vector(0, 0, 0))
		end end)
	end

	self:SetSubMaterial(0, "Models/bsz/invis")

end
--------------------
function ENT:BSZ_CustomOnPreDamaged(dmginfo, hitgroup, status)
	if hitgroup == HITGROUP_HEAD && self.BSZ_Zombie_HasCrab then
		self.BSZ_Zombie_CrabHealth = self.BSZ_Zombie_CrabHealth - dmginfo:GetDamage()
		if self.BSZ_Zombie_CrabHealth > 0 then
			dmginfo:ScaleDamage(0.75)
		else
			dmginfo:SetDamage(self:Health() * 2)
		end
	end
end
--------------------
function ENT:BSZ_CustomOnPostDamaged(dmginfo, hitgroup, status)
	if hitgroup == HITGROUP_HEAD && self.BSZ_Zombie_HasCrab then
		-- PrintMessage(4,""..self.BSZ_Zombie_CrabHealth.."")
		if self.BSZ_Zombie_CrabHealth <= 0 then
			self.NextFlinchT = CurTime() - 10
			-- self.BSZ_Zombie_CrabCorpseVelocity = dmginfo:GetDamageForce() * 5
			self.BSZ_Zombie_CrabCorpseVelocity = dmginfo:GetDamageForce()
			self:BSZ_Zombie_CrabUnlatchEffects("Corpse")
			self.BSZ_Zombie_CrabCorpseVelocity = nil
		end	
	end
end
--------------------
function ENT:TranslateActivity(act)
	if self.BSZ_Zombie_SubType == nil then
		if act == ACT_RUN then
			if self.EnemyData.Distance <= 500 then
				return ACT_RUN
			else
				if self:IsOnFire() then
					return ACT_WALK_ON_FIRE
				else
					return ACT_WALK_AIM
				end
			end
		elseif act == ACT_IDLE then
			if self:IsOnFire() then
				return ACT_IDLE_ON_FIRE
			end
		end
	end
	return act
end
-- function ENT:OnRangeAttackExecute(status, enemy, projectile)
	-- if status == "PreSpawn" && self:IsOnFire() then
		-- projectile.BSZ_Flesh_Burning = true
	-- elseif status == "PostSpawn" then
		-- self.CanFlinch = false
		-- self:TakeDamage(5, self, self)
		-- self.CanFlinch = true
	-- end
-- end
--------------------
-- function ENT:RangeAttackProjPos(projectile)
	-- ParticleEffect("blood_impact_red_01", self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Pos, self:GetAngles(), self)
	-- ParticleEffect("blood_impact_red_01", self:GetAttachment(self:LookupAttachment("anim_attachment_LH")).Pos, self:GetAngles(), self)
	-- VJ.EmitSound(self, "physics/body/body_medium_break"..math.random(2,4)..".wav", 70, math.random(95,105))
	-- if self:GetSequence() == self:LookupSequence("swatleftlow") then
		-- return self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Pos
	-- else
		-- return self:GetAttachment(self:LookupAttachment("anim_attachment_LH")).Pos
	-- end
-- end
--------------------
-- function ENT:RangeAttackProjVel(projectile)
	-- return VJ.CalculateTrajectory(self, self:GetEnemy(), "CurveAntlion", projectile:GetPos(), 0.25, 600)
-- end