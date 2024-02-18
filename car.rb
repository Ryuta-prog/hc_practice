class BaseCar
    attr_reader :year,:price
    
    def inititalize(year,price)
        @year = year
        @prcie = price
    end
    
    def model
        "「#{@year}年に作られました。値段は#{@price}です。」"
    end        
end  

class SportsCar < BaseCar
    attr_reader :speed

    def initialize(year, price, speed)
        @year = year
        @price = price
        @speed = speed
    end
    
    def spec 
        "「#{@year}年に作られました。値段は#{@price}です。」「#{@speed}kmでます。」"
    end
end    
sportscar = SportsCar.new(2000, 2000000,200)
SportsCar = sportscar.spec