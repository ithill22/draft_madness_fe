class League
  attr_reader :name,
              :id,
              :draft_time,
              :draft_date,
              :manager_id

  def initialize(league_data)
    @id = league_data[:id]
    @name = league_data[:attributes][:name]
    @draft_time = league_data[:attributes][:draft_time]
    @draft_date = league_data[:attributes][:draft_date]
    @manager_id = league_data[:attributes][:manager_id]
  end

  def manager_name
    user_details[:data][:attributes][:name]
  end

  private

  def service
    @_service ||= DraftMadnessService.new
  end

  def user_details
    @_user_details ||= service.get_one_user(@manager_id)
  end
end
