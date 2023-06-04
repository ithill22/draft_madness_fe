class League
  attr_reader :name, :draft_date, :draft_time, :manager_id
  def initialize(data)
    @name = data[:name]
    @draft_date = data[:draft_date]
    @draft_time = data[:draft_time]
    @manager_id = data[:manager_id]
  end
end