class LeaguesFacade
  def new_league(league_params)
    League.new(new_league_details(league_params)[:data])
    # new_user_leagues(participants, league.id)
  end

  def league(id)
    League.new(league_details(id)[:data])
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

  # def new_user_leagues(participants, league_id)
  #   require 'pry'; binding.pry
  #   participants.each do |id|
  #     service.new_user_league(id.to_i, league_id)
  #   end
  # end
end