# frozen_string_literal: true

# 自動販売機
class VendingMachine
  attr_reader :sales

  PEPSI = Juice.new("ペプシ", 150)
  MONSTER = Juice.new("モンスター", 230)
  IROHASU = Juice.new("いろはす", 120)

  def initialize(drinks = [], sales = 0)
    @drinks = drinks
    @sales = sales
    5.times { @stocks << PEPSI }
    5.times { @stocks << MONSTER }
    5.times { @stocks << IROHASU }
  end

  def buy(juice_name, suica)
    selected_juice = @juices.count { |juice| juice.name == juice_name }
    raise "{juice_name}の在庫がありません" if selected_juice < 1

    rasie "残高が不足しています" if suica.balancce < selected_juice.price
    suica.pay(selected_juice.price)
    selected_juice -= 1
    @sales += selected_juice.price
  end

  def drinks_info
    @drinks
  end

  def sales_info
    @sales
  end

  def purchasable_list(suica)
    @juices.select { |juice| juices.positive? && suica.balance >= juice.price }.map(&:name)
  end
end
