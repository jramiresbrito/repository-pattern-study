class Room
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 1
    @pacients = attributes[:pacients] || []
    @remaining_spots = @capacity - @pacients.length
  end

  def full?
    @pacients.length == @capacity
  end

  def add_patient(patient)
    return "This room it's full." if full?

    @pacients << patient
    @remaining_spots -= 1
    'Patient added successfully'
  end
end
