# frozen_string_literal: true

# 自動販売機
class VendingMachine
  attr_reader :sales, :drinks

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

    reduce_stotck(juice_name)
    increase_sales(juice_price)
    reduce_suica(suica, juice_price)
  end

  def juice_stock_count(juice_name)
    grouped_stock[juice_name]&.count || 0
  end

  def purchasable_list(suica)
    @juices.select { |juice| juices.positive? && suica.balance >= juice.price }.map(&:name)
  end

  def restock(juice)
    @stock << juice
  end

  private

  def grouped_stock
    @stock.group_by(&:name)
  end

  def reduce_stock(juice_name)
    @stock.delete_at(@stock.index { |item| item.name == juice_name})
  end

  def increase_sales(value)
    @sales += value
  end

  def reduce_suica(suica, value)
    suica.pay(value)
  end
end

