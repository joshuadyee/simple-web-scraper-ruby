require "http"

company_index = HTTP.get("https://financialmodelingprep.com/api/v3/search?query=AA&apikey=tZ0kCqZ87L7SHW4MQTwTdbxWJPVWDVck").parse


# p company_index.first['name']

names = []
i = 0
while i < 20
  company = company_index[i]
  name = company["name"]
  names << name
  i += 1 
end

# p names

tickers = []
i = 0
company_index.length.times do
  company = company_index[i]
  tickers << company["symbol"]
  i += 1
end
# p tickers

p tickers.include? "AAPL"

# puts "What ticker do you want to see the free cash flow of?"
# ticker = tickers.sample
# p ticker


cash_hash = Hash.new(0)
tickers.each do |ticker|
  cash_flow = HTTP.get("https://financialmodelingprep.com/api/v3/cash-flow-statement/#{ticker}?period=annual&apikey=tZ0kCqZ87L7SHW4MQTwTdbxWJPVWDVck").parse[0]["freeCashFlow"]
  p cash_hash[ticker] = cash_flow
end

