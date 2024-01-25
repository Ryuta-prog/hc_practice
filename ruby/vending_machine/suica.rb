class Suica
    def initialize
      @balance = 500
    end
  
    def charge(amount)
      raise "チャージ金額は100円以上である必要があります" if amount < 100
      @balance += amount
    end
  
    def balance
      @balance
    end
  
    def pay(amount)
      raise "残高が不足しています" if amount > @balance
      @balance -= amount
    end
  
    private
  
    def set_balance(new_balance)
      @balance = new_balance
    end
end
  
  class Juice
    attr_reader :name, :price
  
    def initialize(name, price)
      @name = name
      @price = price
    end
  end
  
  class VendingMachine
    def initialize
      @juices = {
        pepsi: Juice.new('ペプシ', 150),
        monster: Juice.new('モンスター', 230),
        irohasu: Juice.new('いろはす', 120)
      }
      @stocks = {
        pepsi: 5,
        monster: 5,
        irohasu: 5
      }
      @sales = 0
    end
  
    def stock(juice_name, new_juice_info, stock)
      @juices[juice_name] = new_juice_info
      @stocks[juice_name] = stock
    end
  
    def buy(juice_name, suica)
      raise "#{juice_name}の在庫がありません" if @stocks[juice_name] < 1
      raise "残高が不足しています" if suica.balance < @juices[juice_name].price
  
      suica.pay(@juices[juice_name].price)
      @stocks[juice_name] -= 1
      @sales += @juices[juice_name].price
    end
  
    def stock_info
      @stocks.map { |name, stock| "#{name}: #{stock}本" }.join(", ")
    end
  
    def purchasable_list(suica)
      @juices.select { |_, juice| @stocks[_] > 0 && suica.balance >= juice.price }.keys
    end
  
    def sales
      @sales
    end
  end
  