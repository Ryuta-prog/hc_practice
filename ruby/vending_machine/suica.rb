class Suica
  attr_reader :balance

  def initialize
    @balance = 500
  end

  def charge(amount)
    raise "チャージ金額は100円以上である必要があります" if amount < 100
    @balance += amount
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

    def stock_info
      @stocks.map { |name, stock| "#{name}: #{stock}本" }.join(", ")
    end

    def purchasable_list(suica)
      @juices.select { |_, juice| @stocks[_] > 0 && suica.balance >= juice.price }.keys
    end

    def sales
      @sales
    end