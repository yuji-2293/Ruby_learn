def algorithm_01(number)
  response = []
  1.upto(number) do |u|
    if u % 3 == 0 && u % 5 == 0
      response << "らんてくん"
    elsif u % 3 == 0
      response << "らんて"
    elsif u % 5 == 0
      response << "くん"
    else
      response << u
    end
  end
  response
end

def algorithm_02(word)
  "#{word}".reverse
end

def algorithm_03(word)
  text = "#{word}".chars.select.with_index { |_, idx| idx.even? }.join
  sentence = "#{word}".chars.select.with_index { |_, idx| idx.odd? }.join
  text + sentence
end
def algorithm_04(text)
  result = []
  word = "#{text}".split(' ')
  word.each do |w|
    clean_word = w.gsub(/[,.]/, '')
    result << clean_word.length
  end
  return result
end
