group = %w[A B C D E F]

group1 = group.sample([2,3,4].sample).sort
group2 = group - group1

p group1
p group2