class UserFacade
  def all_users
    results = DraftMadnessService.new.get_all_users
    users = []
    results[:data].each do |user|
      users << User.new(user)
    end
    users
  end
end