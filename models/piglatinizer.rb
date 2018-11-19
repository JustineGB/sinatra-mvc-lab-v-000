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

  def piglatinize_word(text)
    @text = text
    if vowel(@text[0])
      "#{@text}way"
    elsif !vowel(@text[0]) && !vowel(@text[1]) && !vowel(@text[2])
      "#{@text}#{ending(text)}ay"
    elsif !vowel(@text[0]) && !vowel(@text[1])
      "#{@text}#{middle(text)}ay"
    elsif !vowel(@text[0])
      "#{@text}#{first_letter(text)}ay"
    end
  end

  def piglatinize_words(words)
    @word = words.split(" ")
    @word.collect do |word|
      piglatinize_word(word)
    end.join(" ")
  end

end
