require 'pry'
#take in argument of user_phrase. split sentence (if more than one word) ....@words
#Vowel = add 'way' to the end of the word & #Consonant = move that letter(s)to the end of the word and add 'ay'

class PigLatinizer

  def first_letter(word)
    word.slice!(0)
  end

  def second_letter(word)
    word.slice!(0..1)
  end

  def third_letter(word)
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
      "#{@text}#{third_letter(text)}ay"
    elsif !vowel(@text[0]) && !vowel(@text[1])
      "#{@text}#{second_letter(text)}ay"
    elsif !vowel(@text[0])
      "#{@text}#{first_letter(text)}ay"
    end
  end

  def piglatinize_words(text)
    @text = text.split(" ")
    @text.collect do |word|
      #binding.pry

      piglatinize_word(word)
    end.join(" ")
  end

end
