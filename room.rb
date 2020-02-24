class Room
  class CapacityReachedError < RuntimeError; end

  attr_reader :patients
  attr_accessor :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 1
    @patients = []
    @remaining_spots = @capacity - @patients.length
  end

  def full?
    @patients.length == @capacity
  end

  def add_patients(patients = [])
    raise CapacityReachedError, "This room it's full." if full?
    if patients.length > @remaining_spots
      raise CapacityReachedError, "There are only #{@remaining_spots} spots available"
    end

    patients.each do |patient|
      @patients << patient
      patient.room = self
      puts "Patient #{patient.name} added successfully."
      @remaining_spots -= 1
    end

    "#{@remaining_spots} spots remaining for this room."
  end
end
