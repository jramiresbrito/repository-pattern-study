class Room
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 1
    @pacients = []
    @remaining_spots = @capacity - @pacients.length
  end

  def full?
    @pacients.length == @capacity
  end

  def add_patients(patients)
    return "This room it's full." if full?
    if patients.length > @remaining_spots
      return "There are only #{@remaining_spots} spots available"
    end

    patients.each do |patient|
      @pacients << patient
      patient.room = self
      @remaining_spots -= 1
      puts "Patient #{patient.name} added successfully"
    end

    "#{@remaining_spots} spots remaining for this room."
  end
end
