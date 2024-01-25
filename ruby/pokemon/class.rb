class Pokemon
    attr_reader :name, :type1, :type2, :hp
      
    def initialize
      @name = "リザードン"
      @type1 = "ほのお"
      @type2 = "ひこう"
      @hp = 100
    end
  
    def attack
      puts "#{name}のこうげき"
    end
end
  
  def create_pokemon_100
      Array.new(100) { Pokemon.new }
  end
  
  poke = Pokemon.new
  puts poke.name
  puts poke.type1
  poke.attack
  
  pokemons = create_pokemon_100
  puts pokemons[0].name
  puts pokemons[9].type1
  pokemons[99].attack
  
  
  