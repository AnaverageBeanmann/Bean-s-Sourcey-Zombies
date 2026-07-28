function EFFECT:Init(data)
	local emittertest = ParticleEmitter(data:GetOrigin())

	for _ = 0, 50 do

		local bloodeffects = emittertest:Add("particles/bsz/smokestack", self:GetPos())

		if bloodeffects then
			bloodeffects:SetVelocity(Vector(math.random(-75,75),math.random(-75,75),math.random(25,100)))
			bloodeffects:SetDieTime(5)
			bloodeffects:SetGravity(Vector(0,0,-300))
			bloodeffects:SetStartSize(math.random(1,4))
			bloodeffects:SetEndSize(0)
			bloodeffects:SetCollide(true)
			bloodeffects:SetBounce(0.1)
			if math.random(1,3) == 1 then
				bloodeffects:SetColor(243, 255, 158)
			else
				bloodeffects:SetColor(232, 255, 66)
			end
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