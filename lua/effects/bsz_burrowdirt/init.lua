function EFFECT:Init(data)
	local emittertest = ParticleEmitter(data:GetOrigin())

	for _ = 0, 25 do

		local bloodeffects = emittertest:Add("particle/smokesprites_000"..math.random(1,9), self:GetPos())

		if bloodeffects then
			bloodeffects:SetVelocity(Vector(math.random(-45,45),math.random(-45,45),math.random(50,100)))
			bloodeffects:SetDieTime(5)
			bloodeffects:SetGravity(Vector(0,0,-200))
			bloodeffects:SetStartSize(math.random(1,2))
			bloodeffects:SetEndSize(0)
			bloodeffects:SetCollide(true)
			-- bloodeffects:SetBounce(0.15)
			-- bloodeffects:SetStartAlpha(155)
			bloodeffects:SetEndAlpha(0)
			bloodeffects:SetColor(65, 65, 65)
			-- bloodeffects:SetRoll(1)
			-- bloodeffects:SetRollDelta(math.random(-0.25,0.25))
		end

	end

	for _ = 0, 5 do

		local bloodeffects = emittertest:Add("particle/smokesprites_000"..math.random(1,9), self:GetPos())

		if bloodeffects then
			bloodeffects:SetVelocity(Vector(math.random(-10, 10),math.random(-10, 10),math.random(3,7)))
			bloodeffects:SetDieTime(3)
			-- bloodeffects:SetGravity(Vector(0,0,-300))
			bloodeffects:SetStartSize(math.random(10,15))
			bloodeffects:SetEndSize(math.random(65,75))
			-- bloodeffects:SetCollide(true)
			-- bloodeffects:SetBounce(0.15)
			bloodeffects:SetStartAlpha(50)
			bloodeffects:SetEndAlpha(0)
			bloodeffects:SetColor(65, 65, 65)
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