--TODO: Remove when the new game patch gets released, where the Army is saved
local oldEntity = Entity
Entity = Class(oldEntity) {
    OnCreate = function(self, spec)
        oldEntity.OnCreate(self, spec)
        self.Army = self:GetArmy()
    end,
}