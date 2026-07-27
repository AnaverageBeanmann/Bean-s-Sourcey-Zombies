function EFFECT:Init(data)
	local emittertest = ParticleEmitter(data:GetOrigin())

	for _ = 0, 10 do

		local bloodeffects = emittertest:Add("particle/smokesprites_000"..math.random(1,9), self:GetPos())

		if bloodeffects then
			bloodeffects:SetVelocity(Vector(math.random(-7,7),math.random(-7,7),math.random(-7,7)))
			bloodeffects:SetDieTime(5)
			-- bloodeffects:SetGravity(Vector(0,0,-300))
			bloodeffects:SetStartSize(0)
			bloodeffects:SetEndSize(math.random(45,55))
			-- bloodeffects:SetCollide(true)
			-- bloodeffects:SetBounce(0.15)
			bloodeffects:SetStartAlpha(50)
			bloodeffects:SetEndAlpha(0)
			bloodeffects:SetColor(0, 225, 0)
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