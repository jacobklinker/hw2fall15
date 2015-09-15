require 'part2.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "#rps_game_winner" do
  it "should be defined and execute the game" do
    lambda { rps_game_winner([["X", "P"], ["Y", "S"]]) }.should_not raise_error
  end

  # this is given for free in the outline
  it "should raise WrongNumberOfPlayersError if there are not exactly two players" do
    lambda { rps_game_winner([["Allen", "S"]]) }.should raise_error(WrongNumberOfPlayersError), "No error raised for incorrect number of players"
  end
  
  it "should raise NoSuchStrategyError if one players strat is not valid" do
    lambda {rps_game_winner([["Jake", "X"], ["Luke", "R"]]) }.should raise_error(NoSuchStrategyError)
  end
  
  it "should raise NoSuchStrategyError if one players strat is not valid" do
    lambda {rps_game_winner([["Jake", "P"], ["Luke", "A"]]) }.should raise_error(NoSuchStrategyError)
  end
  
  it "should raise NoSuchStrategyError if one players strat is not valid" do
    lambda {rps_game_winner([["Jake", "x"], ["Luke", "r"]]) }.should raise_error(NoSuchStrategyError)
  end
  
  it "should raise NoSuchStrategyError if one players strat is not valid" do
    lambda {rps_game_winner([["Jake", "p"], ["Luke", "a"]]) }.should raise_error(NoSuchStrategyError)
  end
  
  it "answers are the same, so pick player 1" do
    expect(rps_game_winner([["Jake", "p"], ["Luke", "p"]])).to eq(["Jake", "p"])
  end
  
  it "answers are the same, so pick player 1" do
    expect(rps_game_winner([["Jake", "R"], ["Luke", "R"]])).to eq(["Jake", "R"])
  end
  
  it "answers are the same (different cases), so pick player 1" do
    expect(rps_game_winner([["Jake", "R"], ["Luke", "r"]])).to eq(["Jake", "R"])
  end
  
  it "answers are the same (different cases), so pick player 1" do
    expect(rps_game_winner([["Jake", "s"], ["Luke", "S"]])).to eq(["Jake", "s"])
  end
  
  it "r>s" do
    expect(rps_game_winner([["Jake", "r"], ["Luke", "s"]])).to eq(["Jake", "r"])
  end
  
  it "s>p" do
    expect(rps_game_winner([["Jake", "s"], ["Luke", "p"]])).to eq(["Jake", "s"])
  end
  
  it "p>r" do
    expect(rps_game_winner([["Jake", "p"], ["Luke", "r"]])).to eq(["Jake", "p"])
  end
  
  it "s<r" do
    expect(rps_game_winner([["Jake", "s"], ["Luke", "r"]])).to eq(["Luke", "r"])
  end
  
  it "p<s" do
    expect(rps_game_winner([["Jake", "p"], ["Luke", "s"]])).to eq(["Luke", "s"])
  end
  
  it "r<p" do
    expect(rps_game_winner([["Jake", "r"], ["Luke", "p"]])).to eq(["Luke", "p"])
  end
  
end

describe "#rps_tournament_winner" do
  it "should be defined" do
    lambda { rps_tournament_winner([["X", "P"], ["Y", "S"]]) }.should_not raise_error
  end
  
  it "tournament" do
    expect(rps_tournament_winner(
      [ 
        [ 
          [ ["Joe", "P"], ["Mary", "S"] ], 
          [ ["Bob", "R"], ["Alice", "S"] ] 
        ], 
        [ 
          [ ["Steve", "S"], ["Jane", "P"] ], 
          [ ["Ted", "R"], ["Carol", "P"] ] 
        ] 
      ]
    )).to eq(["Bob", "R"])
  end
  
  it "tournament (deeper)" do
    expect(rps_tournament_winner(
      [
        [ 
          [ 
            [ ["Joe", "P"], ["Mary", "S"] ], 
            [ ["Bob", "R"], ["Alice", "S"] ] 
          ], 
          [ 
            [ ["Steve", "S"], ["Jane", "P"] ], 
            [ ["Ted", "R"], ["Carol", "P"] ] 
          ] 
        ],
        [ 
          [ 
            [ ["Joe", "R"], ["Mary", "S"] ], 
            [ ["Bob", "S"], ["Alice", "S"] ] 
          ], 
          [ 
            [ ["Steve", "R"], ["Jane", "P"] ], 
            [ ["Ted", "R"], ["Carol", "S"] ] 
          ] 
        ]
      ]
    )).to eq(["Jane", "P"])
  end
end
