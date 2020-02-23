require_relative 'patient'
require_relative 'room'

john = Patient.new(name: 'John', cured: false, blood_type: 'A')
room1 = Room.new(pacients: [john])

p john
p room1
p room1.full?

paul = Patient.new(name: 'Paul')
room2 = Room.new(capacity: 4, pacients: [paul])
puts room2.add_patient(john)
p room2
