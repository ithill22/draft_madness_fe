class UsersFacade
  def initialize(session_id = nil)
    @session_id = session_id
  end

  def user_name
    User.new(user_details[:data]).name
  end

  def all_leagues_for_user
    leagues_details[:data]&.map { |league_info| League.new(league_info) }
  end

  def user
    User.new(user_details[:data])
  end

  def all_users
    users_details[:data].map { |user| User.new(user) }
  end

  def articles
    
    articles_data[:data][0..2].map { |article_data| Article.new(article_data) }
  end

  private

  def nyt_service
    @_nyt_service ||= NytService.new
  end

  def articles_data
    @_articles_data ||= nyt_service.all_articles
  end

  def dm_service
    @_dm_service ||= DraftMadnessService.new
  end

  def user_details
    @_user_details ||= dm_service.get_one_user(@session_id)
  end

  def users_details
    @_users_details ||= dm_service.get_all_users
  end

  def leagues_details
    @_leagues_details ||= dm_service.all_leagues_for_one_user(@session_id)
  end
end
