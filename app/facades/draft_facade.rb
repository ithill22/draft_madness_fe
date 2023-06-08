class DraftFacade
  def initialize(league_id)
    @id = league_id
  end

  def league_name
    league_data[:data][:attributes][:name]
  end

  def draft_board
    randomized_order.map.with_index do |user, index|
      pick_number = index + 1
      drafter = user[:data][:attributes][:name]
      team_drafter = selected_team(user[:data][:attributes][:id]) || ""

      round = (pick_number - 1) / 8 + 1

      { pick_number: pick_number, drafter: drafter, team_drafter: team_drafter, round: round}
    end
  end

  def draft_team(team_id)
    pick_details = {
      user_league_id: user_league_id,
      api_team_id: team_id
    }
    service.create_roster_team(pick_details)
  end

  def current_pick
    draft_board[0]
  end

  def next_pick
    draft_board[1]
  end

  def user_roster
    selected_user = league_users.find { |user| user[:data][:attributes][:id] == @user_id }
    roster = selected_user
  end

  private

  def service
    @_service ||= DraftMadnessService.new
  end

  def league_data
    @_league_data ||= service.get_one_league(@id)
  end

  def all_ul_data
    @_all_ul_data ||= service.get_user_leagues(@id)
  end

  def user_data(user_id)
    service.get_one_user(user_id)
  end

  def league_users
    all_ul_data[:data].map do |ul|
      user_data(ul[:attributes][:user_id])
    end
  end

  def randomized_order
    users = league_users.shuffle
    total_teams = 64
    picks_per_user = total_teams / users.count

    order = []

    (1..picks_per_user).each do |pick|
      if (pick - 1) % 8 < 4
        users.each { |user| order << user }
      else
        users.reverse.each { |user| order << user }
      end
    end
    order
  end

  def fetch_user_league(user_id)
    user_leagues = all_ul_data[:data]
    user_leagues.find { |ul| ul[:attributes][:user_id] == user_id }
  end

  def fetch_roster_teams(user_league_id)
    service.get_roster_teams(user_league_id)
  end


end