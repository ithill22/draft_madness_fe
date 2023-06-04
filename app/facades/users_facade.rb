class UsersFacade
  def initialize(session_id)
    @session_id = session_id
  end

  def user_name
    user = User.new(user_details[:data][:attributes])
    user.name
  end

  def user
    User.new(user_details[:data][:attributes])
  end

  private

  def service
    @_service ||= DraftMadnessService.new
  end

  def user_details
    @_user_details ||= service.get_one_user(@session_id)
  end
end
