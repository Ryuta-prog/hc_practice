class Suica
    attr_reader :balancce

    def initialize
        @balancce = 500
    end

    def charge(amount)
        raise "チャージ金額は100円以上である必要があります" if amount < 100
        @balancce += amount
    end

    def pay(amount)
        raise "残高が不足しています" if amount > @balance
        @balancce -= amount
    end


    private

    def set_balance(new_balance)
      @balancce = new_balance
    end
    
    def set stock_info
      @stocks.map {|name, stock| "#{name}: #{stock}"}
    end

    def purchasable_list(suica)
      @juices.select { |_, juice| @stocks[_] > 0 && suica.balance >= juice.price}.keys
    end

    def sales
        @sales
    end    
end