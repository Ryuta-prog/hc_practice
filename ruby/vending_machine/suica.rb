# frozen_string_literal: true

# Suica
class Suica
  def initialize(depogit = 500)
    @depogit = depogit
  end

  def charge(amount)
    raise "チャージ金額は100円以上である必要があります" if amount < 100

    @depogit += amount
  end

  def pay(amount)
    raise "残高が不足しています" if amount > @depogit

    @depogit -= amount
  end

  def check_depogit
    "このSuicaの残高は#{@depogit}円です"
  end
end


