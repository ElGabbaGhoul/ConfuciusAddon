local function GetQuote()
    local quotes = {}
    local file = io.open("quotes.txt", "r")

    if not file then
        print("Could not open the file")
        return nil
    end

    for line in file:lines() do
        table.insert(quotes, line)
    end

    file:close()

    local randomIndex = math.random(1, #quotes)

    return quotes[randomIndex]
end

local function SayQuote()
    local quote = GetQuote()  -- Get a random quote
    if quote then
        print(quote)  -- Output the quote (or use it in another way)
    end
    local randomTime = math.random(120, 300)  -- Random time between 2 to 5 minutes
    C_Timer.After(randomTime, SayQuote)  -- Schedule the next quote
end


local function OnPlayerLogin(self, event, ...)
    SayQuote()
end


local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", OnPlayerLogin)