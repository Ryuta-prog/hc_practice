class Pokemon
    attr_reader :name, :type1, :type2, :hp
    
    def initialize(name, type1, type2, hp)
        @name = name
        @type1 = type1
        @type2 = type2
        @hp = hp
    end

    def attack
        puts "#{@name}のこうげき！"
    end
end

def local_function
    poke = Pokemon.new("SomePokemon", "type1", "type2", 100)
    # ... メソッドの中で何か処理を行う
end

poke = Pokemon.new("ピカチュウ", "type1", "type2", 100)
puts poke.name # ピカチュウ
