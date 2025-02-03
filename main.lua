NefHunterHelper = { }

local function GetEmptyBagSlot ()
	found,j = nil

	for bag = 0, 4 do
		numberOfFreeSlots, BagType = GetContainerNumFreeSlots(bag);
		if (BagType == 0 and numberOfFreeSlots ~= 0)
		then
			for slot = 1, GetContainerNumSlots(bag) do 
				name=GetContainerItemLink(bag,slot);
				if name==nil 
				then 
					found = true;
					break;
				end
			end
			if found == true
			then
				j=bag;
				break;
			end
		end
	end
	return j
end

SLASH_NEFHUNTERHELPER1 = "/unequipranged"
SlashCmdList["NEFHUNTERHELPER"] = function(msg, editBox)
	PickupInventoryItem(18);
	slot = GetEmptyBagSlot();
	if slot == 0 then
		PutItemInBackpack();
	else
		PutItemInBag(slot+19);
	end
end
