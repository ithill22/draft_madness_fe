class League
  attr_reader :id, :name, :draft_date, :draft_time, :manager_id
  def initialize(data)
    @id = data[:id]
    @name = data.dig(:attributes, :name)
    @draft_date = data.dig(:attributes, :draft_date)
    @draft_time = data.dig(:attributes, :draft_time)
    @manager_id = data.dig(:attributes, :manager_id)
  end
end