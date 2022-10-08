# ビンゴサイズの定義
bingo_size = gets.chomp.to_i

# ビンゴカードの作成
# ビンゴカード用の配列を用意
bingo_cards = []
bingo_size.times do
  bingo_cards << gets.chomp.split
end

# 単語の入力回数を定義
number_of_inputs = gets.chomp.to_i

# 単語入力回数がビンゴサイズよりも少なければ、ビンゴになりえないので"no"を返して処理を終了する
if number_of_inputs < bingo_size
  puts "no"
  return
end

# マッチした回数の初期値を定義
match_count = 0

# 入力された単語を判定する処理
number_of_inputs.times do
  # 入力された単語の取得
  input_word = gets.chomp
  bingo_cards.each_with_index do |row, r|
    row.each_with_index do |card_word, c|
      # カードの単語と入力された単語がマッチすれば"#"に変え、マッチした回数を1増やす
      if card_word == input_word
        bingo_cards[r][c] = "#"
        match_count += 1
      end
    end
  end
end

# ビンゴ判定
def is_bingo?(bingo_size, bingo_cards, match_count)
  # マッチした回数での判定
  # マッチした回数がビンゴサイズより少なければ、ビンゴになりえないのでfalseを返す
  if match_count < bingo_size
    return false
  end

  # 横列の判定
  bingo_cards.each do |row|
    # 横列がすべて"#"であればtrueを返す
    if row == [].fill("#", 0, bingo_size)
      return true
    end
  end

  # 縦列の判定
  bingo_cards.transpose.each do |column|
    # 縦列がすべて"#"であればtrueを返す
    if column == [].fill("#", 0, bingo_size)
      return true
    end
  end

  # 左上→右下斜列の判定
  # 判定用の配列を用意
  l_diagram = []
  bingo_size.times do |i|
    l_diagram << bingo_cards[i][i]
  end
  # 配列がすべて"#"であればtrueを返す
  if l_diagram == [].fill("#", 0, bingo_size)
    return true
  end

  # 右上→左下斜列の判定
  # 判定用の配列を用意
  r_diagram = []
  bingo_size.times do |i|
    r_diagram << bingo_cards[(bingo_size - 1) - i][i]
  end
  # 配列がすべて"#"であればtrueを返す
  if r_diagram == [].fill("#", 0, bingo_size)
    return true
  end
end

# ビンゴ判定を実行し結果を表示
puts is_bingo?(bingo_size, bingo_cards, match_count) ? "yes" : "no"