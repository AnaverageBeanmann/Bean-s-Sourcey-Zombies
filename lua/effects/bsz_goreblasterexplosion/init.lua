function EFFECT:Init(data)
	local emittertest = ParticleEmitter(data:GetOrigin())

	for _ = 0, 50 do

		local bloodeffects = emittertest:Add("decals/blood"..math.random(1,8), self:GetPos())

		if bloodeffects then
			bloodeffects:SetVelocity(Vector(math.random(-75,75),math.random(-75,75),math.random(50,350)))
			bloodeffects:SetDieTime(5)
			bloodeffects:SetGravity(Vector(0,0,-300))
			bloodeffects:SetStartSize(math.random(5,7))
			bloodeffects:SetEndSize(0)
			bloodeffects:SetCollide(true)
			bloodeffects:SetBounce(0.15)
		end

	end

	emittertest:Finish()

end
--------------------
function EFFECT:Think()
	return false
end
--------------------
function EFFECT:Render() end