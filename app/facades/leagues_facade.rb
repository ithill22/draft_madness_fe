class LeaguesFacade
  def initialize(id = nil)
    @id = id
  end

  def new_league(league_params)
    League.new(new_league_details(league_params)[:data])
  end

  def league
    League.new(league_details[:data])
  end

  def league_name
    league = League.new(league_data[:data])
    league.name
  end

  def league_id
    league = League.new(league_data[:data])
    league.id
  end

  def league_rosters
    all_ul_data[:data].map { |roster_data| UserLeague.new(roster_data) }
  end

  def league_draft_time
    draft_time = league_data[:data][:attributes][:draft_time]
    DateTime.parse(draft_time) if draft_time.present?
  end

  def user_name(user_id)
    user_data = service.get_one_user(user_id)
    user_data[:data][:attributes][:name]
  end

  private

  def service
    @_service ||= DraftMadnessService.new
  end

  def new_league_details(league_params)
    @_new_league_details ||= service.create_league(league_params)
  end

  def league_details
    @_league_details ||= service.get_one_league(@id)
  end

  def all_ul_data
    @_all_user_league_data ||= service.get_user_leagues(@id)
  end

  def league_data
    @_league_data ||= service.get_league_info(@id)
  end
end
