function EFFECT:Init(data)
	local emittertest = ParticleEmitter(data:GetOrigin())

	for _ = 0, 20 do

		local bloodeffects = emittertest:Add("decals/yblood"..math.random(1,6), self:GetPos())

		if bloodeffects then
			bloodeffects:SetVelocity(Vector(math.random(-75,75),math.random(-75,75),math.random(25,125)))
			bloodeffects:SetDieTime(math.random(4,6))
			bloodeffects:SetGravity(Vector(0,0,-300))
			bloodeffects:SetStartSize(math.random(3,7))
			bloodeffects:SetEndSize(0)
			bloodeffects:SetCollide(true)
			-- bloodeffects:SetBounce(0.15)
		end

	end

	for _ = 0, 3 do

		local bloodeffects = emittertest:Add("particle/smokesprites_000"..math.random(1,9), self:GetPos())

		if bloodeffects then
			bloodeffects:SetVelocity(Vector(math.random(-7, 7),math.random(-7, 7),math.random(3,7)))
			bloodeffects:SetDieTime(3)
			-- bloodeffects:SetGravity(Vector(0,0,-300))
			bloodeffects:SetStartSize(math.random(10,15))
			bloodeffects:SetEndSize(math.random(35,40))
			-- bloodeffects:SetCollide(true)
			-- bloodeffects:SetBounce(0.15)
			bloodeffects:SetStartAlpha(75)
			bloodeffects:SetEndAlpha(0)
			bloodeffects:SetColor(180, 160, 52)
			bloodeffects:SetRoll(1)
			bloodeffects:SetRollDelta(math.random(-0.25,0.25))
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