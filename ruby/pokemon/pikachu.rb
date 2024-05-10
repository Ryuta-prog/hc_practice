# frozen_string_literal: true

# Pokemonクラスを作成
class Pokemon
    include NameService

    attr_reader :name, :type1, :type2, :hp

    def initialize(name, type1, type2, hp)
        @name = name
        @type1 = type1
        @type2 = type2
        @hp = hp
    end

    def attack
        puts "#{name}のこうげき"
    end
end