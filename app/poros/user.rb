class User
  attr_reader :id, :name, :email
  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @email = data[:email]
  end
end