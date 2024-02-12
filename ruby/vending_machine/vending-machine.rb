class VendingMachine
  attr_reader :sales

  def initialize
    @juices = [
      5.times { Juice.new('ペプシ', 150) },
      5.times { Juice.new('モンスター', 230) },
https://prod.liveshare.vsengsaas.visualstudio.com/join?17A74485269E83868A1B7370E28F66FC1449https://prod.liveshare.vsengsaas.visualstudio.com/join?17A74485269E83868A1B7370E28F66FC1449class VendingMachine
5.times { Juice.new('いろはす', 120) }
    ]
    @sales = 0
  end

  def buy(juice_name, suica)
    selected_juice = @juices.find { juice.name == juice_name }

    raise "#{juice_name}の在庫がありません" if selected_juice.stock < 1
    raise "残高が不足しています" if suica.balance < selected_juice.price

    suica.pay(selected_juice.price)
    selected_juice -= 1
    @sales += selected_juice.price
  end

  def remove_juice(juice_name)
    @juices.reject! { |juice| juice.name == juice_name }
  end

  def stock_info
    @juices.map { |juice| "#{juice.name}: #{juice.stock}本" }.join(", ")
  end

  def purchasable_list(suica)
    @juices.select { |juice| juice.stock > 0 && suica.balance >= juice.price }.map(&:name)
  end
end
