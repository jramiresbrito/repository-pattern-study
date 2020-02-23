class Room
  class CapacityReachedError < RuntimeError; end

  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 1
    @pacients = []
    @remaining_spots = @capacity - @pacients.length
  end

  def full?
    @pacients.length == @capacity
  end

  def add_patients(patients)
    raise CapacityReachedError, "This room it's full." if full?
    if patients.length > @remaining_spots
      raise CapacityReachedError, "There are only #{@remaining_spots} spots available"
    end

    patients.each do |patient|
      @pacients << patient
      patient.room = self
      @remaining_spots -= 1
    end

    "Patients added successfully. #{@remaining_spots} spots remaining for this room."
  end
end
