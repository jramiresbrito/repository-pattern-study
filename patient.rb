class Patient
  attr_reader :name, :cured
  attr_accessor :room
  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @blood_type = attributes[:blood_type] || 'A'
  end

  def cure
    @cured = true
  end
end
