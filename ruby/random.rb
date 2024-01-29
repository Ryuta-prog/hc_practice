class GroupRandomizer
    def initialize(members)
        @members = members.shuffle

    end

    def randomize_groups
        group1_size = [2,3].sample
        group1 = @members.shift(group1_size)
        group2 = @members

        [group1.sort, group2.sort]
    end
end

if __FILE__ == $0
    members = ["A","B","C","D","E","F"]

    randomizer = GroupRandomizer.new(members)

    result = randomizer.randomize_groups

    puts result[0]
    puts result[1]
end