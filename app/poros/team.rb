class Team
  attr_reader :id, :name, :seed, :region

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @seed = data[:attributes][:seed]
    @region = data[:attributes][:region]
  end
end