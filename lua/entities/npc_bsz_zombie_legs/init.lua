include("entities/npc_bsz_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/zombie_legs.mdl"
ENT.StartHealth = 35
ENT.FlinchHitGroupMap = {
	{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}},
	{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.HasIdleSounds = false
ENT.HasAlertSounds = false
ENT.SoundTbl_BeforeMeleeAttack = false
ENT.HasPainSounds = false
ENT.HasDeathSounds = false
ENT.SoundTbl_MeleeAttackExtra = {
	"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"
}
-- ENT.FootstepSoundLevel = 55
ENT.BSZ_Zombie_SubType = "Legs"
ENT.BSZ_Zombie_CanTaunt = false
--------------------
function ENT:BSZ_Zombie_CustomOnInit()
	self:SetCollisionBounds(Vector(10, 10, 40), Vector(-10, -10, 0))
	self:SetSurroundingBounds(Vector(20, 20, 80), Vector(-20, -20, 0))
	if !self.BSZ_Zombie_LegsSpawnedFromSplitting then
		if GetConVar("bsz_spawnintros"):GetInt() == 1 then
			self:BSZ_DoSpawnSequence()
		else
			local ed = EffectData()
			ed:SetEntity( self )
			util.Effect( "propspawn", ed, true, true )
		end
	end
end
--------------------