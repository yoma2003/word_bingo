require 'minitest/autorun'
require 'stringio'

class TestWordBingo < Minitest::Test
  def test_1
    str = <<~EOS
      3
      apple orange cube
      batch web cloud
      sql http https
      7
      web
      https
      windows
      batch
      keyboard
      apple
      cpu
    EOS
    $stdin = StringIO.new(str)
    $stdout = StringIO.new
    load './word_bingo.rb'
    assert_equal 'yes', $stdout.string.chomp
  end

  def test_2
    str = <<~EOS
      3
      cpp kotlin typescript
      csharp ruby php
      go rust dart
      5
      java
      delphi
      fortran
      haskell
      python
    EOS
    $stdin = StringIO.new(str)
    $stdout = StringIO.new
    load './word_bingo.rb'
    assert_equal 'no', $stdout.string.chomp
  end

  def test_3
    str = <<~EOS
      4
      beer wine gin vodka
      beef chicken pork seafood
      ant bee ladybug beetle
      bear snake dog camel
      7
      be
      bear
      bee
      beef
      been
      beer
      beetle
    EOS
    $stdin = StringIO.new(str)
    $stdout = StringIO.new
    load './word_bingo.rb'
    assert_equal 'no', $stdout.string.chomp
  end

  def test_4
    str = <<~EOS
      7
      a b c d e f g
      h i j k l m n
      o p q r s t u
      v w x y z aa ab
      ac ad ae af ag ah ai
      aj ak al am an ao ap
      aq ar as at au av aw
      7
      g
      aq
      m
      s
      y
      ae
      ak
    EOS
    $stdin = StringIO.new(str)
    $stdout = StringIO.new
    load './word_bingo.rb'
    assert_equal 'yes', $stdout.string.chomp
  end

  def test_5
    str = <<~EOS
      3
      a b c
      d e f
      g h i
      1
      e
    EOS
    $stdin = StringIO.new(str)
    $stdout = StringIO.new
    load './word_bingo.rb'
    assert_equal 'no', $stdout.string.chomp
  end

  def test_6
    str = "1000"
    str += "\n"
    1000000.times do |n|
      str += "#{n + 1} "
      if (n + 1) % 1000 == 0
        str += "\n"
      end
    end
    str += "2000"
    str += "\n"
    2000.times do |m|
      str += "#{m + 1}\n"
    end
    $stdin = StringIO.new(str)
    $stdout = StringIO.new
    load './word_bingo.rb'
    assert_equal 'yes', $stdout.string.chomp
  end
end