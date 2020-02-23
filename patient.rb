class Patient
  attr_reader :name, :cured

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @blood_type = attributes[:blood_type] || 'A'
  end

  def cure
    @cured = true
  end
end
