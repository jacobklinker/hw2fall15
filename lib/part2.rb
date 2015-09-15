class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  
  pick1 = game[0][1].downcase
  pick2 = game[1][1].downcase
  
  raise NoSuchStrategyError unless (pick1.gsub(/(r|s|p)/, '').length == 0) && (pick2.gsub(/(r|s|p)/, '').length == 0)
  
  if pick1 == pick2
    return game[0]
  elsif pick1 == 'r' && pick2 == 's'
    return game[0]
  elsif pick1 == 's' && pick2 == 'p'
    return game[0]
  elsif pick1 == 'p' && pick2 == 'r'
    return game[0]
  else
    return game[1]
  end
end

def rps_tournament_winner(tournament)
  if (tournament[0][0].class == String)
    return rps_game_winner(tournament)
  end
  
  tournament[0] = rps_tournament_winner(tournament[0])
  tournament[1] = rps_tournament_winner(tournament[1])
  return rps_tournament_winner(tournament)
end
