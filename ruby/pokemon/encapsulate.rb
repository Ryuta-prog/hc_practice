class Pokemon
    include NameService
  
    attr_reader :type1, :type2, :hp
  
    def initialize
      @name = ""
    end
  
    def attack
      raise NotImplementedError, "Subclasses must implement the attack method"
    end
end
  
  module NameService
    def change_name(new_name)
      # 不適切な名前はエラー
      if new_name == "うんこ"
        puts "不適切な名前です"
        return
      end
      @name = new_name
    end
  
    def get_name
      @name
    end
  end
  
  class Player
    include NameService
  
    def initialize
      # Playerの初期化処理
      @name = ""
    end
  end
  