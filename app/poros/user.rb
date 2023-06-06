class User
  attr_reader :name, :email, :id

  def initialize(user_details)
    @id = user_details[:id]
    @name = user_details[:attributes][:name]
    @email = user_details[:attributes][:email]
  end
end
