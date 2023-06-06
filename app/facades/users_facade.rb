class UsersFacade
  def initialize(session_id)
    @session_id = session_id
  end

  def user_name
    user = User.new(user_details[:data])
    user.name
  end

  def all_leagues_for_user
    leagues_details[:data]&.map do |league_info|
      League.new(league_info)
    end
  end

  def user
    User.new(user_details[:data])
  end

  private

  def service
    @_service ||= DraftMadnessService.new
  end

  def user_details
    @_user_details ||= service.get_one_user(@session_id)
  end

  def leagues_details
    @_leagues_details ||= service.all_leagues_for_one_user(@session_id)
  end
end
