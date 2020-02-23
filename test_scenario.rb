require_relative 'patient'
require_relative 'room'

john = Patient.new(name: 'John', cured: false, blood_type: 'A')
room1 = Room.new(pacients: [john])

p john
p room1.full?

paul = Patient.new(name: 'Paul')
george = Patient.new(name: 'George')
geralt = Patient.new(name: 'Geralt of Rivia')
triss = Patient.new(name: 'Triss Merigold')

room2 = Room.new(capacity: 4)

puts room2.add_patients([paul, george, geralt, triss])

yennefer = Patient.new(name: 'Yennefer of Vengerberg')
puts room2.add_patients([yennefer])
