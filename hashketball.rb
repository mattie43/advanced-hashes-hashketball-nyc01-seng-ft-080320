# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each { |d_i| return d_i[:points] if d_i[:player_name] == player_name }
      end
    end
  end
end
def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each { |d_i| return d_i[:shoe] if d_i[:player_name] == player_name }
      end
    end
  end
end
def team_colors(team_name)
  game_hash.each { |location, team_data| return team_data[:colors] if team_data[:team_name] == team_name }
end
def team_names
  game_hash.each_with_object([]) { |(key, value), teams| teams << value[:team_name] }
end
def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each { |data| numbers << data[:number] }
    end
  end
  numbers
end
def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each { |d_i| return d_i if d_i[:player_name] == player_name }
      end
    end
  end
end
def big_shoe_rebounds
  #find largest shoe, return number of rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |d_i|
          if shoe_size < d_i[:shoe]
            shoe_size = d_i[:shoe]
            rebounds = d_i[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  player = ""
  points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |d_i|
          if points < d_i[:points]
            player = d_i[:player_name]
            points = d_i[:points]
          end
        end
      end
    end
  end
  player
end

def winning_team
  team_home = ""
  team_away = ""
  points_home = 0
  points_away = 0
  game_hash.each do |location, team_data|
    if location == :home
      team_data.each do |attribute, data|
        team_home = attribute
        if attribute == :players
          data.each { |d_i| points_home += d_i[points] }
        end
      end
    else
      team_data.each do |attribute, data|
        if attribute == :players
          data.each { |d_i| points_away += d_i[points] }
        end
      end
    end
  end
  #points_home if 
end