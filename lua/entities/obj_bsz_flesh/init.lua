AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = {
	"models/vj_base/gibs/human/gib_small1.mdl",
	"models/vj_base/gibs/human/gib_small2.mdl",
	"models/vj_base/gibs/human/gib_small3.mdl"
}
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.CollisionDecal = "Blood"
ENT.DoesDirectDamage = true
ENT.DirectDamage = 5
ENT.DirectDamageType = DMG_CLUB
ENT.SoundTbl_OnRemove = {
	"physics/flesh/flesh_squishy_impact_hard1.wav",
	"physics/flesh/flesh_squishy_impact_hard2.wav",
	"physics/flesh/flesh_squishy_impact_hard3.wav",
	"physics/flesh/flesh_squishy_impact_hard4.wav"
}
ENT.OnRemoveSoundLevel = 70
ENT.OnRemoveSoundPitch = VJ.SET(90, 110)
--------------------
ENT.BBoHG_Flesh_Burning = false
--------------------
function ENT:Init()
	ParticleEffect("blood_impact_red_01", self:GetPos(), self:GetAngles(), self)
	self:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-500,500),math.random(-500,500),math.random(-500,500)))
	if self.BBoHG_Flesh_Burning then
		self:Ignite(10)
		self.DirectDamageType = bit.bor(DMG_CLUB, DMG_BURN)
	end
end
--------------------
function ENT:OnDestroy(data, phys)
	ParticleEffect("blood_impact_red_01", self:GetPos() + self:OBBCenter(), self:GetAngles(), self)
end