class User
    attr_reader :name,:age

    def initialize(name,age)
        @name = name
        @age  = age
    end

    def introduction
        "「#{@name}です。#{@age}才です。」"
    end
end

class Group
    attr_reader :users

    def initialize(users)
        @users = users
        @users = 10.times { User }
    end
end

10.times do 
    puts   "「#{@name}です。#{@age}才です。」"
end