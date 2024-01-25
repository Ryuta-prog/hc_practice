class Pokemon
    attr_reader :name, :type1, :type2, :hp

    def attack
        puts "#{name}のこうげき！"
    end
end


class Pikachu < Pokemon
    def initialize(name, type1, type2, hp)
      super()
      @name = name
      @type1 = type1
      @type2 = type2
      @hp = hp  
    end

    def attack
        super.attack
        puts "#{name}の10万ボルト！"
    end
end


pika = Pikachu.new("ピカチュウ","でんき","",100)
puts pika.attack  # ピカチュウのこうげき！＼ピカチュウの10万」」ボルト！