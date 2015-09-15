def palindrome?(str)
  str = str.downcase.gsub(/[^a-z0-9]/, '')
  str == str.reverse
end

def count_words(str)
  words = str.downcase.gsub(/[^a-z0-9 ]/, '').split(' ')
  freq = Hash.new(0)
  words.each { |word| freq[word] += 1 }
  return freq
end