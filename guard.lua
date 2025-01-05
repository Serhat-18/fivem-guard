AddEventHandler('entityCreating', function(entity)
    local entitymiz = GetEntityType(entity) -- Entity tipini çekiyoruz

    if entitymiz == 3 then  -- eğer entity tipi 3 ise işlem yapılacak (0 = none / 1 = ped / 2 = Araç / 3 = Obje)
        local source = NetworkGetEntityOwner(entity) 
        --[[ Bu kısma herhangi bir ban exportu ekleyebilirsiniz örnekteki gibi
            exports['serhatsal-base']:BanPlayer(source, 'Obje Spawnladı')
        ]]
            DropPlayer(source, 'Obje Spawnlamak Yasaktır !') -- Oyuncuyu kikcler
                CancelEvent() -- Obje Spawnlanmasını engeller ()
    end
end)



-- EK KONTROL
local BlockedObjects = { -- Örnek modeller
    "prop_medstation_04",
    "prop_tool_blowtorch"
}
for _, blockedObj in ipairs(BlockedObjects) do -- BlockedObjects içindeki veriyi al
    if model == GetHashKey(blockedObj) then -- eğer çıkan model BlockedObjects içinde var ise
        CancelEvent() -- işlemi iptal et (objeyi sil)
        DropPlayer(source, 'Yasaklı Obje Spawn') -- Oyuncuyu kikcle
                --[[ Bu kısma herhangi bir ban exportu ekleyebilirsiniz örnekteki gibi
            exports['serhatsal-base']:BanPlayer(source, 'Obje Spawnladı')
        ]]
        return
    end
end