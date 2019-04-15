require "pry"
def find_the_season(data, season)
  data.fetch(season)
end

def get_first_name_of_season_winner(data, season)
  season_data = find_the_season(data, season)
    season_data.each do |contestant_data|
      if contestant_data["status"] == "Winner"
        name = contestant_data["name"].split
        return name[0]
      end
    end
end

def get_contestant_name(data, occupation)
  data.find do |season_data, season|
    season.find do |contestant_data|
      if contestant_data["occupation"] == occupation
        return contestant_data["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_data, season|
    season.each do |contestant_data|
      if contestant_data["hometown"] == hometown
        counter += 1
      end
    end
  end
  return counter
end

def get_occupation(data, hometown)
  data.find do |season_data, season|
    season.find do |contestant_data|
      if contestant_data["hometown"] == hometown
        return contestant_data["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  arr = []
  season_data = find_the_season(data, season)
    season_data.each do |contestant_data|
      arr << contestant_data["age"].to_i
    end
    return (arr.inject(0.0) { |sum, el| sum + el } / arr.size).round

end

