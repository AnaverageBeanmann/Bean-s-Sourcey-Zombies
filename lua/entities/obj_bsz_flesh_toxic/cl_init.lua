AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
function ENT:Initialize()
	self.BBoHG_GhoulFleshEmitter = ParticleEmitter(self:GetPos())
end
--------------------
function ENT:Think()
	local bloodeffects = self.BBoHG_GhoulFleshEmitter:Add("decals/yblood"..math.random(1,6), self:GetPos())
	if bloodeffects then
		bloodeffects:SetVelocity(Vector(math.random(-10,10),math.random(-10,10),math.random(-10,10)))
		bloodeffects:SetDieTime(5)
		bloodeffects:SetGravity(Vector(0,0,-300))
		bloodeffects:SetStartSize(math.random(1,3))
		bloodeffects:SetEndSize(0)
		bloodeffects:SetCollide(true)
		bloodeffects:SetBounce(0.15)
	end
end
--------------------
function ENT:OnRemove()
	self.BBoHG_GhoulFleshEmitter:Finish()
end