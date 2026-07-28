include("entities/npc_bsz_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/charred.mdl"
--------------------
ENT.MeleeAttackDamageType = DMG_CLUB
--------------------
ENT.SoundTbl_Idle = {
	"vj_osz/smod/standard/zombie_voice_idle2.wav",
	"vj_osz/smod/standard/zombie_voice_idle3.wav",
	"vj_osz/smod/standard/zombie_voice_idle4.wav",
	"vj_osz/smod/standard/zombie_voice_idle5.wav",
	"vj_osz/smod/standard/zombie_voice_idle6.wav",
	"vj_osz/smod/standard/zombie_voice_idle7.wav",
	"vj_osz/smod/standard/zombie_voice_idle8.wav",
	"vj_osz/smod/standard/zombie_voice_idle9.wav",
	"vj_osz/smod/standard/zombie_voice_idle10.wav"
}
ENT.SoundTbl_Alert = {
	"vj_osz/smod/standard/zombie_alert1.wav",
	"vj_osz/smod/standard/zombie_alert2.wav",
	"vj_osz/smod/standard/zombie_alert3.wav",
	"vj_osz/smod/standard/zombie_alert4.wav",
	"vj_osz/smod/standard/zombie_alert5.wav",
	"vj_osz/smod/standard/zombie_alert6.wav"
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"vj_osz/smod/standard/zo_attack1.wav",
	"vj_osz/smod/standard/zo_attack2.wav"
}
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
ENT.SoundTbl_BeforeRangeAttack = {
	"vj_osz/smod/standard/zo_attack1.wav",
	"vj_osz/smod/standard/zo_attack2.wav"
}
ENT.SoundTbl_Pain = {
	"vj_osz/smod/standard/zombie_pain1.wav",
	"vj_osz/smod/standard/zombie_pain2.wav",
	"vj_osz/smod/standard/zombie_pain3.wav",
	"vj_osz/smod/standard/zombie_pain4.wav",
	"vj_osz/smod/standard/zombie_pain5.wav",
	"vj_osz/smod/standard/zombie_pain6.wav",
	"vj_osz/smod/standard/zombie_pain7.wav"
}
ENT.SoundTbl_Death = {
	"vj_osz/smod/standard/zombie_die1.wav",
	"vj_osz/smod/standard/zombie_die2.wav",
	"vj_osz/smod/standard/zombie_die3.wav"
}
--------------------
ENT.BSZ_Zombie_MainType = "Charred"
ENT.BSZ_Zombie_MeleeDamage = 10
ENT.BSZ_Zombie_MeleeDamage_Duo = 15
ENT.BSZ_Zombie_MeleeDamage_Weak = 5
ENT.BSZ_Zombie_CanPlayBurningSound = false
-- ENT.BSZ_Zombie_BurningSoundTbl = {
	-- "bbohg/vo/zombie/zombiemaster/shambler/moan_loop1.wav",
	-- "bbohg/vo/zombie/zombiemaster/shambler/moan_loop2.wav",
	-- "bbohg/vo/zombie/zombiemaster/shambler/moan_loop3.wav",
	-- "bbohg/vo/zombie/zombiemaster/shambler/moan_loop4.wav"
-- }
--------------------
function ENT:BSZ_Zombie_CustomOnInit()

	-- self.HasRangeAttack = true
	-- self.RangeAttackProjectiles = "obj_bsz_flesh"
	-- self.AnimTbl_RangeAttack = ACT_RANGE_ATTACK1
	-- self.RangeAttackMinDistance = 75
	-- self.RangeAttackMaxDistance = 350
	-- self.TimeUntilRangeAttackProjectileRelease = false

	self:SetSkin(math.random(0,3))

	if GetConVar("bsz_spawnintros"):GetInt() == 1 then
		self:BSZ_DoSpawnSequence()
	else
		local ed = EffectData()
		ed:SetEntity( self )
		util.Effect( "propspawn", ed, true, true )
	end

end
--------------------
function ENT:BSZ_CustomOnPreDamaged(dmginfo, hitgroup, status)
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
		dmginfo:SetDamage(0)
		if !self:IsOnFire() then
			self:Ignite(10)
		end
	elseif dmginfo:GetDamageType() == (DMG_BURN or DMG_SLOWBURN) then
		dmginfo:ScaleDamage(0.20)
		if !self:IsOnFire() then
			self:Ignite(10)
		end
	else
		dmginfo:ScaleDamage(0.90)
	end
end
--------------------
function ENT:BSZ_CustomOnPostDamaged(dmginfo, hitgroup, status)
	if dmginfo:IsBulletDamage() && !self:IsOnFire() && math.random(1,5) == 1 && !self:IsBusy() then
		self:PlayAnim("vjseq_releasecrab", true, 1, false)
		timer.Simple(0.25, function() if IsValid(self) then
			VJ.EmitSound(self, "ambient/fire/gascan_ignite1.wav", 70, math.random(95,105))
			self:Ignite(10)
		end end)
	end
end
--------------------
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