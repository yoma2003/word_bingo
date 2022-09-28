# ビンゴサイズの定義
bingo_size = gets.chomp.to_i

# ビンゴカードの作成
bingo_cards = []
bingo_size.times do
  bingo_cards << gets.chomp.split
end

# 単語入力回数の定義
number_of_inputs = gets.chomp.to_i

# 入力された単語を判定する処理
number_of_inputs.times do
  # 入力された単語の取得
  input_word = gets.chomp
  bingo_cards.each_with_index do |row, r|
    row.each_with_index do |card_word, c|
      # カードの中に入力された単語があれば"#"に変える
      if card_word == input_word
        bingo_cards[r][c] = "#" 
      end
    end
  end
end


# 結果初期値の定義
result = "no"

# 横列の判定
bingo_size.times do |r|
  # 確認用の配列を用意
  check_array = []
  bingo_size.times do |c|
    check_array << bingo_cards[r][c]
  end
  # 配列がすべて"#"であればresultを"yes"に変える
  if check_array == [].fill("#", 0, bingo_size)
    result = "yes"
  end
end

# 縦列の判定
bingo_size.times do |c|
  # 確認用の配列を用意
  check_array = []
  bingo_size.times do |r|
    check_array << bingo_cards[r][c]
  end
  # 配列がすべて"#"であればresultを"yes"に変える
  if check_array == [].fill("#", 0, bingo_size)
    result = "yes"
  end
end

# 右斜列の判定
# 確認用の配列を用意
check_array = []
bingo_size.times do |i|
  check_array << bingo_cards[i][i]
end
# 配列がすべて"#"であればresultを"yes"に変える
if check_array == [].fill("#", 0, bingo_size)
  result = "yes"
end

# 左斜列の判定
# 確認用の配列を用意
check_array = []
bingo_size.times do |i|
  check_array << bingo_cards[(bingo_size - 1) - i][i]
end
# 配列がすべて"#"であればresultを"yes"に変える
if check_array == [].fill("#", 0, bingo_size)
  result = "yes"
end


#結果を出力
puts result