AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
function ENT:Initialize()
	self.BBoHG_GhoulFleshEmitter = ParticleEmitter(self:GetPos())
end
--------------------
function ENT:Think()
	local bloodeffects = self.BBoHG_GhoulFleshEmitter:Add("particles/bbohg/smokestack", self:GetPos())
	if bloodeffects then
		bloodeffects:SetVelocity(Vector(math.random(-10,10),math.random(-10,10),math.random(-10,10)))
		bloodeffects:SetDieTime(math.random(2,5))
		bloodeffects:SetGravity(Vector(0,0,-300))
		bloodeffects:SetStartSize(math.random(1,3))
		bloodeffects:SetEndSize(0)
		bloodeffects:SetCollide(true)
		bloodeffects:SetBounce(0.1)
		if math.random(1,3) == 1 then
			bloodeffects:SetColor(243, 255, 158)
		else
			bloodeffects:SetColor(232, 255, 66)
		end
		bloodeffects:SetStartAlpha(150)
		bloodeffects:SetEndAlpha(0)
	end
end
--------------------
function ENT:OnRemove()
	self.BBoHG_GhoulFleshEmitter:Finish()
end