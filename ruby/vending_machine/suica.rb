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
  
  class VendingMachine
    def initialize
      @juices = {
        pepsi: { juice: Juice.new('ペプシ', 150), stock: 5 },
        monster: { juice: Juice.new('モンスター', 230), stock: 5 },
        irohasu: { juice: Juice.new('いろはす', 120), stock: 5 }
      }
      @sales = 0
    end
  
    def stock(juice_name, new_juice_info, stock)
      @juices[juice_name] = { juice: new_juice_info, stock: stock }
    end
  
    def buy(juice_name, suica)
      raise "#{juice_name}の在庫がありません" if @juices[juice_name][:stock] < 1
      raise "残高が不足しています" if suica.balance < @juices[juice_name][:juice].price
  
      suica.pay(@juices[juice_name][:juice].price)
      @juices[juice_name][:stock] -= 1
      @sales += @juices[juice_name][:juice].price
    end
  
    def stock_info
      @juices.map { |name, info| "#{name}: #{info[:stock]}本" }.join(", ")
    end
  
    def purchasable_list(suica)
      @juices.select { |_, info| info[:stock] > 0 && suica.balance >= info[:juice].price }.keys
    end
  
    def sales
      @sales
    end
  end
  