function EFFECT:Init(data)
	local emittertest = ParticleEmitter(data:GetOrigin())

	for _ = 0, 40 do

		local bloodeffects = emittertest:Add("decals/blood"..math.random(1,8), self:GetPos())

		if bloodeffects then
			bloodeffects:SetVelocity(Vector(math.random(-100,100),math.random(-100,100),math.random(-25,300)))
			bloodeffects:SetDieTime(15)
			bloodeffects:SetGravity(Vector(0,0,-325))
			bloodeffects:SetStartSize(math.random(6,9))
			bloodeffects:SetEndSize(0)
			bloodeffects:SetCollide(true)
			-- bloodeffects:SetBounce(0.15)
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