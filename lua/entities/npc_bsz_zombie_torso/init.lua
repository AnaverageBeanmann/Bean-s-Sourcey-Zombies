include("entities/npc_bsz_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/zombie_torso.mdl"
ENT.StartHealth = 65
ENT.JumpParams = {
	Enabled = false
}
ENT.CanFlinch = false
ENT.HasMeleeAttackKnockBack = false
ENT.FootstepSoundLevel = 55
ENT.BSZ_Zombie_SubType = "Torso"
ENT.BSZ_Zombie_CanTaunt = false
ENT.BSZ_Zombie_CanBreakDoors = false
--------------------
function ENT:BSZ_Zombie_CustomOnInit()
	self:SetCollisionBounds(Vector(10, 10, 25), Vector(-10, -10, 0))
	self:SetSurroundingBounds(Vector(20, 20, 50), Vector(-20, -20, 0))
	self:SetSkin(math.random(0,1))
	if math.random(1,3) == 1 then
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
	if GetConVar("bsz_spawnintros"):GetInt() == 1 then
		self:BSZ_DoSpawnSequence()
	else
		local ed = EffectData()
		ed:SetEntity( self )
		util.Effect( "propspawn", ed, true, true )
	end
end