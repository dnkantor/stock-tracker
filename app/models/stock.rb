class Stock < ApplicationRecord

    def self.find_by_ticker(ticker_symbol)
        where(ticker: ticker_symbol).first
    end
     
    def self.new_from_lookup(ticker_symbol)
        begin
            client = IEX::Api::Client.new(publishable_token: 'pk_c3719aaa1dfc479e889055c9aa776ae1')
            looked_up_stock = client.quote(ticker_symbol)
            new(name: looked_up_stock.company_name,
                ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
        rescue Exception => e
            return nil
        end
    end
    
end