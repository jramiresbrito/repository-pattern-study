require_relative 'patient'
require_relative 'room'

jhon = Patient.new(name: 'John', cured: false, blood_type: 'A')
room_1 = Room.new(capacity: 2)

p jhon
p room_1
