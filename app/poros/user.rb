class User
  attr_reader :id, :name, :email, :google_id, :auth_token
  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @email = data[:email]
    @google_id = data[:google_id]
    @auth_token = data[:auth_token]
  end
end