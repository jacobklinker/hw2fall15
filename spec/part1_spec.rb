require 'part1.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "#palindrome?" do
  it "should be defined" do
    lambda { palindrome?("Testing") }.should_not raise_error
  end
  it "racecar should be a palindrome" do
    expect(palindrome?("racecar")).to eq(true)
  end
  it "Racecar! should be a palindrome" do
    expect(palindrome?("Racecar!")).to eq(true)
  end
  it "there goes the neighborhood should not be a palindrome" do
    expect(palindrome?("there goes the neighborhood")).to eq(false)
  end
  it "Madam, I'm Adam is a palindrome" do
    expect(palindrome?("Madam, I'm Adam")).to eq(true)
  end
  it "Hannah is a palindrome" do
    expect(palindrome?("Hannah")).to eq(true)
  end
  it "Jake is not a palindrome" do
    expect(palindrome?("Jake")).to eq(false)
  end
  it "Abracadabra is not a palindrome" do
    expect(palindrome?("Abracadabra")).to eq(false)
  end
end

describe "#count_words" do
  it "should be defined" do
    lambda { count_words("Testing") }.should_not raise_error
  end
  it "should return a Hash" do
    count_words("Testing").class.should == Hash
  end
  it "test 'A man, a plan, a canal -- Panama'" do
    expect(count_words("A man, a plan, a canal -- Panama")['a']).to eq(3)
    expect(count_words("A man, a plan, a canal -- Panama")['man']).to eq(1)
    expect(count_words("A man, a plan, a canal -- Panama")['--']).to eq(0)
  end
  it "test 'Doo bee doo bee doo'" do
    expect(count_words("Doo bee doo bee doo")["doo"]).to eq(3)
    expect(count_words("Doo bee doo bee doo")["bee"]).to eq(2)
  end
end
