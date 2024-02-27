class User
   def initialize(name, age)
      @name = name
      @age = age
   end

    def name
        @name
    end

    def age
        @age
    end

    def introduce
        "私は#{@name}です。#{@age}です "
    end
end
user = User.new("taro","20")
user1 = user.introduce
user1

