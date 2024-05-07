# frozen_string_literal: true

lines = readlines

lines[0] = lines[0].gsub("\n", ' ')
lines[1] = lines[1].gsub("\n", ' ')

x = lines[0].split(',')
y = lines[1].split(',')

x.map!(&:to_i)
y.map!(&:to_i)

score_names = {

 -4 => 'コンドル',
 -3 => 'アルバトロス',
 -2 => 'イーグル',
 -1 => 'バーディ',
 0 => 'バー',
 1 => 'ボギー',
 2 => '2ボギー',
 3 => '3ボギー'
}

result = []

x.zip(y) do |hole, player|
  score = player - hole

  if player == 1 && [3, 4].include?(hole)
    result.push('ホールインワン')
  else
    result.push(score_names[score])
  end
end

puts result.join(',')