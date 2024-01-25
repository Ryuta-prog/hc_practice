class Pokemon
    attr_reader :name, :type1, :type2, :hp

    def initialize(name, type1, type2, hp)
        @name = name
        @type1 = type1
        @type2 = type2
        @hp = hp
    end


    def attack
        "#{name} のこうげき！"

    end
end


class Pikachu < Pokemon
    def initialize(name, type1,type2, hp)
      super(name,type1,type2, hp)
    end

    def attack
        "#{name}の10万ボルト！"
    end
end

def main
  pika = Pikachu.new("ピカチュウ","でんき","", 100)

  puts pika.name     #ピカチュウ
  puts pika.attack   #ピカチュウの１０万ボルト！
end


main