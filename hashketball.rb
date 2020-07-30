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
    team_data[:players].each { |data| return data[:points] if data[:player_name] == player_name }
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each { |data| return data[:shoe] if data[:player_name] == player_name }
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
    team_data[:players].each { |data| return data if data[:player_name] == player_name }
  end
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if shoe_size < data[:shoe]
        shoe_size = data[:shoe]
        rebounds = data[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  player = ""
  points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if points < data[:points]
        player = data[:player_name]
        points = data[:points]
      end
    end
  end
  player
end

def winning_team
  team_home = game_hash[:home][:team_name]
  team_away = game_hash[:away][:team_name]
  points_home = 0
  points_away = 0
  game_hash[:home][:players].each { |data1| points_home += data1[:points] }
  game_hash[:away][:players].each { |data2| points_home += data2[:points] }
  if points_home > points_away
    team_home
  else
    team_away
  end
end

def player_with_longest_name
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      player = data[:player_name] if data[:player_name].length > player.length
    end
  end
  player
end

def long_name_steals_a_ton?
  most_steals = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if most_steals < data[:steals]
        player = data[:player_name]
        most_steals = data[:steals]
      end
    end
  end
  player == player_with_longest_name
end