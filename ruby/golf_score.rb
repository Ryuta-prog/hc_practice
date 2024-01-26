SCORES = {
    1 => "ホールインワン",
    -1 => "バーディ",
    -2 => "イーグル",
    -3 => "アルバトロス",
    -4 => "コンドル",
    0 => "パー",
}

par_scores = gets.chomp.split(",").map(&:to_i)

player_scores = gets.chomp.split(",").map(&:to_i)

results = []

par_scores.zip(player_scores).each do |par, score|
    diff = score - par

    if SCORES.key?(diff)
        if (par == 3 || par == 4) && score == 1
          results << "ホールインワン"
        else
          results << SCORES[diff]
        end
    elsif diff > 0
        results << "#{diff}ボギー"
    else
        results << "#{-diff}アンダー"
    end
end

puts results.join(",")