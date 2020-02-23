class Room
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 1
    @pacients = attributes[:pacients] || []
  end

  def full?
    @pacients.length == @capacity
  end
end
