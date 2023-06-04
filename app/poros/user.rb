class User
  attr_reader :name, :email

  def initialize(user_details)
    @name = user_details[:name]
    @email = user_details[:email]
  end
end
