class User
  attr_reader :id, :name, :email
  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
  end
end