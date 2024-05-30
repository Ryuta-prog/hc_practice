# frozen_string_literal: true

# 自動販売機
class VendingMachine
  attr_reader :sales, :stocks

  PEPSI = Juice.new("ペプシ", 150)
  MONSTER = Juice.new("モンスター", 230)
  IROHASU = Juice.new("いろはす", 120)

  def initialize(stocks = [], sales = 0)
    @stocks = stocks
    @sales = sales
    5.times { @stocks << PEPSI }
    5.times { @stocks << MONSTER }
    5.times { @stocks << IROHASU }
  end

  def buy(juice_name, suica)
    selected_juice = @stocks.find { |juice| juice.name == juice_name }
    raise "#{juice_name}の在庫がありません" if selected_juice.nil?

    raise "残高が不足しています" if suica.balance < selected_juice.price

    suica.pay(selected_juice.price)
    @sales += selected_juice.price

    reduce_stock(juice_name)
  end

  def juice_stock_count(juice_name)
    grouped_stock[juice_name]&.count || 0
  end

  def purchasable_list
    grouped_stock.inject([]) do |result, (juice_name, juice_stocks)|
      juice_stocks.count.positive? ? result << juice_name : result
    end
  end

  def restock(juice)
    @stocks << juice
  end

  private

  def grouped_stock
    @stocks.group_by(&:name)
  end

  def reduce_stock(juice_name)
    @stocks.delete_at(@stocks.index { |item| item.name == juice_name })
  end
end
