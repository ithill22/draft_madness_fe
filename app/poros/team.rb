class Team
  attr_reader :id, :type, :name, :region, :seed

  def initialize(data)
    @id = data[:id]
    @type = data[:type]
    @name = data[:attributes][:name]
    @region = data[:attributes][:region]
    @seed = data[:attributes][:seed]
  end
end