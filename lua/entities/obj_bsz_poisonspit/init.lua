AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/spitball_medium.mdl"
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.CollisionDecal = "BeerSplash"
ENT.DoesDirectDamage = true
ENT.DirectDamage = 20
ENT.DirectDamageType = DMG_POISON -- POISON or ACID ??
ENT.SoundTbl_Startup = {
	"bullchicken/bc_acid1.wav",
	"bullchicken/bc_acid2.wav"
}
ENT.SoundTbl_OnRemove = {
	"bullchicken/bc_spithit1.wav",
	"bullchicken/bc_spithit2.wav"
}
	-- "player/spitter/swarm/spitter_acid_fadeout.wav",
	-- "player/spitter/swarm/spitter_acid_fadeout2.wav"
ENT.OnRemoveSoundLevel = 70
ENT.OnRemoveSoundPitch = VJ.SET(90, 110)
--------------------
ENT.BBoHG_Flesh_Burning = false
--------------------
function ENT:Init()
	ParticleEffectAttach("antlion_spit_trail", 1, self, 0)
	ParticleEffect("blood_impact_antlion_worker_01", self:GetPos(), self:GetAngles(), self)
	self:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-500,500),math.random(-500,500),math.random(-500,500)))
	if self.BBoHG_Flesh_Burning then
		self:Ignite(10)
		self.DirectDamageType = bit.bor(DMG_CLUB, DMG_BURN)
	end
end
--------------------
function ENT:OnDestroy(data, phys)

	ParticleEffect("blood_impact_antlion_worker_01", self:GetPos() + self:OBBCenter(), self:GetAngles(), self)

	local effectBlood = EffectData()
	effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
	util.Effect("bbohg_poisonspitsplat", effectBlood)

end