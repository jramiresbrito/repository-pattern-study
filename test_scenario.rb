require_relative 'patient'
require_relative 'room'

john = Patient.new(name: 'John', cured: false, blood_type: 'A')
room1 = Room.new()

room1.add_patients([john])

puts "Room 1 it's full?"
p room1.full?
p john

=begin
paul = Patient.new(name: 'Paul')
george = Patient.new(name: 'George')
geralt = Patient.new(name: 'Geralt of Rivia')
triss = Patient.new(name: 'Triss Merigold')

room2 = Room.new(capacity: 4)

puts room2.add_patients([paul, george, geralt, triss])

yennefer = Patient.new(name: 'Yennefer of Vengerberg')
puts room2.add_patients([yennefer])
=end
