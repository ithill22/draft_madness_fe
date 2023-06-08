class Team
  attr_reader :id, :name, :seed, :games_won, :region

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @seed = data[:attributes][:seed]
    @games_won = data[:attributes][:games_won]
    @region = data[:attributes][:region]
  end
end