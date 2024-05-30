# frozen_string_literal: true

# Suica
class Suica
  def initialize(deposit = 500)
    @deposit = deposit
  end

  def charge(amount)
    raise "チャージ金額は100円以上である必要があります" if amount < 100

    @deposit += amount
  end

  def pay(amount)
    raise "残高が不足しています" if amount > @deposit

    @deposit -= amount
  end

  def check_deposit
    "このSuicaの残高は#{@deposit}円です"
  end

  def balance
    @deposit
  end
end
