NefHunterHelper = { }

local function GetBagWithFreeSlot()
	for bag = 0, 4 do
		local numberOfFreeSlots, bagType = C_Container.GetContainerNumFreeSlots(bag)
		if (bagType == 0 and numberOfFreeSlots ~= 0) then
			return bag
		end
	end
	return nil
end

SLASH_NEFHUNTERHELPER1 = "/unequipranged"
SlashCmdList["NEFHUNTERHELPER"] = function(msg, editBox)
	local bag = GetBagWithFreeSlot()
	if bag == nil then
		print("No empty bag slots")
		return
	end
	PickupInventoryItem(18)
	if bag == 0 then
		PutItemInBackpack()
	else
		PutItemInBag(bag+30)
	end
end
