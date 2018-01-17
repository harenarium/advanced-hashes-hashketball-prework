# Write your code here!
require "pry"

def game_hash
  {home: {team_name: "Brooklyn Nets", colors: ["Black","White"],
      players: {
        "Alan Anderson" => {
          number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1 },
        "Reggie Evans" => {
          number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7} ,
        "Brook Lopez" => {
          number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15} ,
        "Mason Plumlee" => {
          number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5} ,
        "Jason Terry" => {
          number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away: {team_name: "Charlotte Hornets", colors: ["Turquoise","Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2} ,
        "Bismak Biyombo" => {
          number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10} ,
        "DeSagna Diop" => {
          number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5} ,
        "Ben Gordon" => {
          number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0} ,
        "Brendan Haywood" => {
          number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end


def num_points_scored(player_name)
  game_hash.each{|team, team_info|
    team_info[:players].each{|player,info|
      if player == player_name
        return info[:points]
      end
    }
  }
end

def shoe_size(player_name)
  game_hash.each{|team, team_info|
    team_info[:players].each{|player,info|
      if player == player_name
        return info[:shoe]
      end
    }
  }
end

def team_colors (team_name)
  game_hash.each{|team, team_info|
    if team_info[:team_name] == team_name
      return team_info[:colors]
    end
  }
end

def team_names
  array = []
  game_hash.each{|team, team_info|
    array << team_info[:team_name]
  }
  array
end

def player_numbers(team_name)
  array = []
  game_hash.each{|team, team_info|
    if team_info[:team_name] == team_name
      team_info[:players].values.each{|x|
        array << x[:number]
      }
    end
  }
  array
end

def player_stats(player_name)
  game_hash.each{|team, team_info|
    team_info[:players].each{|player,info|
      if player == player_name
        return info
      end
    }
  }
end

def big_shoe_rebounds
  big_shoe = 0
  big_shoe_name = ""
  game_hash.each{|team, team_info|
    team_info[:players].each{|player,info|
      if info[:shoe] > big_shoe
        big_shoe = info[:shoe]
        big_shoe_name = player
      end
    }
    team_info[:players].each{|player,info|
      if player == big_shoe_name
        return info[:rebounds]
      end
    }
  }
end

def most_points_scored
  most_points = 0
  most_points_name = ""
  game_hash.each{|team, team_info|
    team_info[:players].each{|player,info|
      if info[:points] > most_points
        most_points = info[:points]
        most_points_name = player
      end
    }
  }
  most_points_name
end

def winning_team
  most_points = 0
  most_points_team = ""
  game_hash.each{|team, team_info|
    point_count = 0
    team_info[:players].each{|player,info|
      point_count +=info[:points]
    }
    if point_count > most_points
      most_points = point_count
      most_points_team = team
    end
  }
  most_points_team
end
