local env = module("umb_fac","config")

local verify = 0

Citizen.CreateThread(function()
    while verify == 0 do
        verify = verify + 1
        local json = require("json")
        local value = env.license
        print(value)



        PerformHttpRequest("http://localhost:3000/api/liscensesP", function(err, text, headers) 
            local notLicense = '{"error":"Sem licensa!","result":"none"}'
            
            if err == 0 then
                print("")
                print("\27[37m[\027[31mumb_fac\27[37m] \27[37mScript \027[31mRecusado\27[37m Sem licensa!") -- Cinza, Amarelo, Cinza, Verde, Azul
                print("[\27[38;5;229mDiscord\27[37m]")
                Citizen.Wait(2000)
                os.exit()
            end
            if text == notLicense then
                print("")
                print("\27[37m[\027[31mumb_fac\27[37m] \27[37mScript \027[31mRecusado\27[37m Sem licensa!") -- Cinza, Amarelo, Cinza, Verde, Azul
                print("[\27[38;5;229mDiscord\27[37m]")
                Citizen.Wait(5000)
                os.exit()

            else
                Citizen.Wait(7000)
                print("")
                print("\27[37m[\027[94mumb_fac\27[37m] \27[37mScript \027[94mIniciada\27[37m com sucesso ") -- Cinza, Amarelo, Cinza, Verde, Azul
                print("[\27[38;5;229mDiscord\27[37m]")
            end
        end, 'POST', value, { ['Content-Type'] = 'application/json', ['hux'] = value })

		PerformHttpRequest("http://localhost:3000/api/liscenses", function(errorCode, resultData, resultHeaders)
			local responseData = json.decode(resultData)
            local resultData = tostring(resultData)
            local notLicense = '{"error":"Sem licensa!","result":"none"}'
            if errorCode == 0 then
                print("")
                print("\27[37m[\027[31mumb_fac\27[37m] \27[37mScript \027[31mRecusado\27[37m Sem licensa!") -- Cinza, Amarelo, Cinza, Verde, Azul
                print("[\27[38;5;229mDiscord\27[37m]")
                Citizen.Wait(2000)
                os.exit()
            end
            if resultData == notLicense then
                print("")
                print("\27[37m[\027[31mumb_fac\27[37m] \27[37mScript \027[31mRecusado\27[37m Sem licensa!") -- Cinza, Amarelo, Cinza, Verde, Azul
                print("[\27[38;5;229mDiscord\27[37m]")
                Citizen.Wait(5000)
                os.exit()
            else
                Citizen.Wait(7000)
                print("")
                print("\27[37m[\027[94mumb_fac\27[37m] \27[37mScript \027[94mIniciado\27[37m com sucesso ") -- Cinza, Amarelo, Cinza, Verde, Azul
                print("[\27[38;5;229mDiscord\27[37m]")
            end
		end)
    end
end)
