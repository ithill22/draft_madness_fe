class UserLeaguesFacade
  def create_user_league(ul_details)
    service.new_user_league(ul_details)
  end

  private
  
  def service
    @_service ||= DraftMadnessService.new
  end
end