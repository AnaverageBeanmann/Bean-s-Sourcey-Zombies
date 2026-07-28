AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/Gibs/HGIBS_rib.mdl"
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.CollisionDecal = "Blood"
ENT.DoesDirectDamage = true
ENT.DirectDamage = 5
-- ENT.DirectDamageType = DMG_CLUB
ENT.SoundTbl_OnRemove = {
	"physics/body/body_medium_break2.wav",
	"physics/body/body_medium_break3.wav",
	"physics/body/body_medium_break4.wav"
}
ENT.OnRemoveSoundLevel = 70
ENT.OnRemoveSoundPitch = VJ.SET(90, 110)
--------------------
function ENT:Init()
	ParticleEffect("blood_impact_red_01", self:GetPos(), self:GetAngles(), self)
	self:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-500,500),math.random(-500,500),math.random(-500,500)))
	self:SetMaterial("models/skeleton/skeleton_bloody")
end
--------------------
function ENT:OnDestroy(data, phys)
	ParticleEffect("blood_impact_red_01", self:GetPos() + self:OBBCenter(), self:GetAngles(), self)
end