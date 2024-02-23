class User
    attr_reader :name,:age
    
    def initialize(name,age)
        @name = name
        @age  = age 
    end  
    
    def user
        "「#{@name}です。#{@age}才です。」"
    end    
end    

class Group < User
    
    def initialize(name,age)
        super(name,age)
    end    
    
    def user
        users = 10.times.map{ super } 
    end 
    
    def users_output
        puts user
    end    

    group = Group.new("X",00)
    group.users_output

end    