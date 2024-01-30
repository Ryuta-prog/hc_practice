class VendingMachine
  attr_reader :sales

  def initialize
    @juices = [
      Juice.new('ペプシ', 150),
      Juice.new('ペプシ', 150),
      Juice.new('ペプシ', 150),
      Juice.new('ペプシ', 150),
      Juice.new('ペプシ', 150),
      Juice.new('モンスター', 230),
      Juice.new('モンスター', 230),
      Juice.new('モンスター', 230),
      Juice.new('モンスター', 230),
      Juice.new('モンスター', 230),
      Juice.new('いろはす', 120),
      Juice.new('いろはす', 120),
      Juice.new('いろはす', 120),
      Juice.new('いろはす', 120),
      Juice.new('いろはす', 120),
    ]
    @sales = 0
  end

  def stock(juice_name, new_juice_info, stock)
  end

  def buy(juice_name, suica)
    selected_juice = @juices.find { |juice| juice.name == juice_name }

    raise "#{juice_name}の在庫がありません" if selected_juice.stock < 1
    raise "残高が不足しています" if suica.balance < selected_juice.price

    suica.pay(selected_juice.price)
    selected_juice.stock -= 1
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
