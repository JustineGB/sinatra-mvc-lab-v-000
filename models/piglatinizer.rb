require 'pry'
#take in argument of user_phrase. split sentence (if more than one word) ....@words
#Vowel = add 'way' to the end of the word & #Consonant = move that letter(s)to the end of the word and add 'ay'

class PigLatinizer

  def first_letter(word)
    word.slice!(0)
  end

  def middle(word)
    word.slice!(0..1)
  end

  def ending(word)
    word.slice!(0..2)
  end

  def piglatinize(text)
    if text.split(" ").length == 1
      piglatinize_word(text)
    else
      piglatinize_words(text)
    end
  end

  def vowel(letter)
    letter.match(/[aeiouAEIOU]/)
  end

  def piglatinize_word(word)
    @word = word
    if vowel(@word[0])
      "#{@word}way"
    elsif !vowel(@word[0]) && !vowel(@word[1]) && !vowel(@word[2])
      "#{@word}#{ending(word)}ay"
    elsif !vowel(@word[0]) && !vowel(@word[1])
      "#{@word}#{middle(word)}ay"
    elsif !vowel(@word[0])
      "#{@word}#{first_letter(word)}ay"
    end
  end

  def piglatinize_words(words)
    @word = words.split(" ")
    @word.collect do |word|
      piglatinize_word(word)
    end.join(" ")
  end

end
