class LeaguesFacade
  def new_league(league_params)
    League.new(league_details(league_params))
  end

  private

  def service
    @_service ||= DraftMadnessService.new
  end

  def league_details(league_params)
    @_league_details ||= service.create_league(league_params)
  end
end