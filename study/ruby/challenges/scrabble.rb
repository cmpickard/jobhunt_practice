=begin
Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:

Letter	Value
A, E, I, O, U, L, N, R, S, T	1
D, G	2
B, C, M, P	3
F, H, V, W, Y	4
K	5
J, X	8
Q, Z	10
How to Score

Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:

=end

require 'minitest/autorun'

class Scrabble
  LETTER_GROUPS = { %w(A E I O U L N R S T) => 1,
                    %w(D G) => 2,
                    %w(B C M P) => 3,
                    %w(F H V W Y) => 4,
                    %w(K) => 5,
                    %w(J X) => 8,
                    %w(Q Z) => 10 }
                    
  LETTER_SCORES = LETTER_GROUPS.keys.each_with_object({}) do |letter_arr, hash|
    letter_arr.each { |letter| hash[letter] = LETTER_GROUPS[letter_arr] }
  end

  def initialize(word)
    @word = word ? word : ''
  end

  def score()
    return Scrabble.score(@word)
  end

  def self.score(word)
    letters = word.upcase.chars
    values = letters.map do |char|
      /[A-Z]/.match?(char) ? LETTER_SCORES[char] : 0
    end

    return values.sum
  end
end

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    assert_equal 13, Scrabble.score('alacrity')
  end
end