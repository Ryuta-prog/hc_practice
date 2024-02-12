class VendingMachine
  attr_reader :sales

  def initialize
    @juices = [
      5.times { Juice.new('ペプシ', 150) },
      5.times { Juice.new('モンスター', 230) },
      5.times { Juice.new('いろはす', 120) }
    ]
    @sales = 0
  end

  def buy(juice_name, suica)
    selected_juice = @juices.select { |juice| juice.name == juice_name }
    raise "#{juice_name}の在庫がありません" if selected_juice < 1
    raise "残高が不足しています" if suica.balance < selected_juice.price

    suica.pay(selected_juice.price)
    selected_juice -= 1
    @sales += selected_juice.price
  end

  def remove_juice(juice_name)
    @juices.select { |juice| juice.name == juice_name }
  end

  def sales_info
    @juices.select { |juice| "#{juice.name}: #{juice.select}本" }.join(", ")
  end

  def purchasable_list(suica)
    @juices.select { |juice| juices > 0 && suica.balance >= juice.price }.map(&:name)
  end
end