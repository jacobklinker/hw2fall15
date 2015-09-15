require 'part4.rb'

class Foo
  attr_accessor_with_history :bar
end

class Bar
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "Class" do
  
  it "should have an attr_accessor_with_history method" do
    lambda { Class.new.attr_accessor_with_history :x }.should_not raise_error
  end
  
  it "should keep a history of changes" do
    f = Foo.new
    f.bar = 3
    f.bar = :wowza
    f.bar = 'boo!'
    
    expect(f.bar_history).to eq([nil, 3, :wowza, 'boo!'])
  end
  
  it "should keep a history of changes for multiple instance variables" do
    f = Bar.new
    f.bar = 3
    f.bar = :wowza
    f.bar = 'boo!'
    f.foo = "Hey what's up?"
    
    expect(f.bar_history).to eq([nil, 3, :wowza, 'boo!'])
    expect(f.foo_history).to eq([nil, "Hey what's up?"])
  end
  
  it "should maintain a different history for each object instance" do
    f = Foo.new
    f.bar = 3
    f.bar = :wowza
    f = Foo.new
    f.bar = 4
    
    expect(f.bar_history).to eq([nil, 4])
  end
  
end

