class LeaguesFacade
  def initialize

  def new_league(league_params)
    League.new(new_league_details(league_params)[:data])
  end

  def league(id)
    League.new(league_details(id)[:data])
  end

  def empty_params?(params)
    params.each do |k,_v|
      return true if !params[k].present?
    end
    false
  end

  def eight_players?(participants)
    participants.count == 8
  end

  private

  def service
    @_service ||= DraftMadnessService.new
  end

  def new_league_details(league_params)
    @_new_league_details ||= service.create_league(league_params)
  end

  def league_details(id)
    @_league_details ||= service.get_one_league(id)
  end
end