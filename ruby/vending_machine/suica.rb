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
end