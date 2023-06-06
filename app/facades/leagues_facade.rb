class LeaguesFacade
  def initialize(params)
    @id = params[:id]
  end

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

  def league_name
    league = League.new(league_data)
     league.name
   end
 
   def league_id
     league = League.new(league_data)
     league.id
   end
 
   def league_rosters
     all_user_leagues_data[:data].map do |roster_data|
       UserLeague.new(roster_data)
     end
   end
 
   def league_draft_time
     draft_time = league_data[:data][:attributes][:draft_time]
     DateTime.parse(draft_time) if draft_time.present?
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

  def all_user_leagues_data
    _all_user_league_data ||= service.get_user_leagues(@id)
  end
  
  def league_data
    _league_data ||= service.get_one_league(@id)
  end
end