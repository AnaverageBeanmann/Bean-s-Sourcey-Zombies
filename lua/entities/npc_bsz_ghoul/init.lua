include("entities/npc_bsz_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/ghoul.mdl"
ENT.StartHealth = 85
--------------------
ENT.MeleeAttackDamageType = DMG_CLUB
--------------------
ENT.HasRangeAttack = true
ENT.RangeAttackProjectiles = "obj_bsz_flesh"
ENT.AnimTbl_RangeAttack = ACT_RANGE_ATTACK1
ENT.RangeAttackMinDistance = 75
ENT.RangeAttackMaxDistance = 350
ENT.TimeUntilRangeAttackProjectileRelease = false
--------------------
ENT.SoundTbl_Idle = {
	"bsz/vo/zombiemaster/shambler/growl_0.wav",
	"bsz/vo/zombiemaster/shambler/growl_1.wav",
	"bsz/vo/zombiemaster/shambler/growl_2.wav",
	"bsz/vo/zombiemaster/shambler/growl_3.wav",
	"bsz/vo/zombiemaster/shambler/growl_4.wav",
	"bsz/vo/zombiemaster/shambler/growl_5.wav",
	"bsz/vo/zombiemaster/shambler/growl_6.wav",
	"bsz/vo/zombiemaster/shambler/growl_7.wav",
	"bsz/vo/zombiemaster/shambler/growl_8.wav",
}
ENT.SoundTbl_Alert = {
	"bsz/vo/zombiemaster/shambler/growl_0.wav",
	"bsz/vo/zombiemaster/shambler/growl_1.wav",
	"bsz/vo/zombiemaster/shambler/growl_2.wav",
	"bsz/vo/zombiemaster/shambler/growl_3.wav",
	"bsz/vo/zombiemaster/shambler/growl_4.wav",
	"bsz/vo/zombiemaster/shambler/growl_5.wav",
	"bsz/vo/zombiemaster/shambler/growl_6.wav",
	"bsz/vo/zombiemaster/shambler/growl_7.wav",
	"bsz/vo/zombiemaster/shambler/growl_8.wav",
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"bsz/vo/zombiemaster/shambler/zo_attack1.wav",
	"bsz/vo/zombiemaster/shambler/zo_attack2.wav"
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
	"bsz/vo/zombiemaster/shambler/zo_attack1.wav",
	"bsz/vo/zombiemaster/shambler/zo_attack2.wav"
}
ENT.SoundTbl_Pain = {
	"bsz/vo/zombiemaster/shambler/hit_0.wav",
	"bsz/vo/zombiemaster/shambler/hit_1.wav",
	"bsz/vo/zombiemaster/shambler/hit_2.wav",
	"bsz/vo/zombiemaster/shambler/hit_3.wav",
	"bsz/vo/zombiemaster/shambler/hit_4.wav",
	"bsz/vo/zombiemaster/shambler/hit_5.wav",
	"bsz/vo/zombiemaster/shambler/hit_6.wav",
	"bsz/vo/zombiemaster/shambler/hit_7.wav"
}
ENT.SoundTbl_Death = {
	"bsz/vo/zombiemaster/shambler/hit_0.wav",
	"bsz/vo/zombiemaster/shambler/hit_1.wav",
	"bsz/vo/zombiemaster/shambler/hit_2.wav",
	"bsz/vo/zombiemaster/shambler/hit_3.wav",
	"bsz/vo/zombiemaster/shambler/hit_4.wav",
	"bsz/vo/zombiemaster/shambler/hit_5.wav",
	"bsz/vo/zombiemaster/shambler/hit_6.wav",
	"bsz/vo/zombiemaster/shambler/hit_7.wav"
}
ENT.DeathSoundPitch = VJ.SET(70,80)
--------------------
ENT.BSZ_Zombie_MainType = "Ghoul"
ENT.BSZ_Zombie_MeleeDamage = 10
ENT.BSZ_Zombie_MeleeDamage_Duo = 15
ENT.BSZ_Zombie_MeleeDamage_Weak = 5
ENT.BSZ_Zombie_BurningSoundTbl = {
	"bsz/vo/zombiemaster/shambler/moan_loop1.wav",
	"bsz/vo/zombiemaster/shambler/moan_loop2.wav",
	"bsz/vo/zombiemaster/shambler/moan_loop3.wav",
	"bsz/vo/zombiemaster/shambler/moan_loop4.wav"
}
--------------------
function ENT:BSZ_Zombie_CustomOnInit()

	self:SetSkin(math.random(0,1))

	if GetConVar("bsz_spawnintros"):GetInt() == 1 then
		self:BSZ_DoSpawnSequence()
	else
		local ed = EffectData()
		ed:SetEntity( self )
		util.Effect( "propspawn", ed, true, true )
	end

end
--------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
	if status == "PreSpawn" && self:IsOnFire() then
		projectile.BSZ_Flesh_Burning = true
	elseif status == "PostSpawn" then
		self.CanFlinch = false
		self:TakeDamage(5, self, self)
		self.CanFlinch = true
		-- if self:Health() <= self:GetMaxHealth() * 0.3 then
			-- self.HasRangeAttack = false
		-- end
	end
end
--------------------
function ENT:RangeAttackProjPos(projectile)
	ParticleEffect("blood_impact_red_01", self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Pos, self:GetAngles(), self)
	ParticleEffect("blood_impact_red_01", self:GetAttachment(self:LookupAttachment("anim_attachment_LH")).Pos, self:GetAngles(), self)
	VJ.EmitSound(self, "physics/body/body_medium_break"..math.random(2,4)..".wav", 70, math.random(95,105))
	if self:GetSequence() == self:LookupSequence("swatleftlow") then
		return self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Pos
	else
		return self:GetAttachment(self:LookupAttachment("anim_attachment_LH")).Pos
	end
end
--------------------
function ENT:RangeAttackProjVel(projectile)
	return VJ.CalculateTrajectory(self, self:GetEnemy(), "CurveAntlion", projectile:GetPos(), 0.25, 600)
end