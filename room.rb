class Room
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 1
    @pacients = attributes[:pacients] || []
  end
end
