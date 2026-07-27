AddCSLuaFile()
--------------------
ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.AdminOnly = false
--------------------
function ENT:Initialize()
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self:SetSolid(SOLID_NONE)
	self:AddEffects(EF_BONEMERGE)
end