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

# ジュース
class Juice
    attr_reader :name, :price
    def initialize(name, price)
    @name = name
    @price = price
    end
end

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
