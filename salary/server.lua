local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end

local JOB_WAGE = 100

CreateTimer(function()
    for key, player in pairs(GetAllPlayers()) do
        if PlayerData[player] then 

            -- THOSE HAS TO BE ORDER BY WAGE AMOUNT (desc)
            if PlayerData[player].job == "medic" then
                PlayerData[player].bank_balance = PlayerData[player].bank_balance + Config.MedicSalary
            elseif PlayerData[player].job == "police" then
                PlayerData[player].bank_balance = PlayerData[player].bank_balance + Config.PoliceSalary
            elseif PlayerData[player].job ~= nil then
                PlayerData[player].bank_balance = PlayerData[player].bank_balance + JOB_WAGE
            else
                PlayerData[player].bank_balance = PlayerData[player].bank_balance + Config.defaultSalary
            end
            PlayerData[player].bank_balance = PlayerData[player].bank_balance + salary
            CallRemoteEvent(player, "MakeSuccessNotification", _("salary_notification", _("price_in_currency", tostring(salary))))
        end
	end
end, Config.salaryTime * 60000)