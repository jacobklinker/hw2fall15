require 'part3.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "dessert" do
  
  it "should define a constructor" do
    lambda { Dessert.new('a', 1) }.should_not raise_error
  end
  
  %w(healthy? delicious?).each do |method|
    it "should define #{method}" do
      Dessert.new('a',1).should respond_to method
    end
  end  
  
  it "should be healthy" do
    expect(Dessert.new("a", 1).healthy?).to eq(true)
  end
  
  it "should not be healthy" do
    expect(Dessert.new("b", 500).healthy?).to eq(false)
  end
  
  it "should not be healthy" do
    expect(Dessert.new("c", 200).healthy?).to eq(false)
  end
  
  it "should be delicious" do
    expect(Dessert.new("anything", 0).delicious?).to eq(true)
  end
  
end


describe "jellybean" do
  
  it "should define a constructor" do
    lambda { JellyBean.new('a', 1, 2) }.should_not raise_error
  end
  
  %w(healthy? delicious? ).each do |method|
    it "should define #{method}" do
      JellyBean.new('a',1, 2).should respond_to method 
    end
  end
  
  it "should be delicious" do
    expect(JellyBean.new("a", 0, "black").delicious?).to eq(true)
  end
  
  it "should not be delicious" do
    expect(JellyBean.new('b', 0, "black licorice").delicious?).to eq(false)
  end
  
end
