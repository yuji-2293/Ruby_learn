def algorithm_01(number)
  response = []
  while number < 101 do
    if number % 3 == 0 && number % 5 == 0
      response << "らんてくん"
    elsif number % 3 == 0
      response << "らんて"
    elsif number % 5 == 0
      response << "くん"
    else
      response << number
    end
    number += 1
  end
  response
end
number = 1
p algorithm_01(number)

def algorithm_02(word)
  @word = "#{word}".reverse
  puts @word
end
puts algorithm_02("RUNTEQ")

def algorithm_03(word)
  @select = "#{word}".chars.select.with_index { |_, idx| idx.even? }.join
  puts @select
end
puts algorithm_03("あらるんごてりくずんむ")
def algorithm_04(text)
  result = []
  word = "#{text}".split(' ')
  word.each do |w|
    clean_word = w.gsub(/[^a-zA-Z]/, '')
    result << clean_word.length
  end
  return result
end
p algorithm_04("Things may come to those who wait, but only the things left by those who hustle.")
