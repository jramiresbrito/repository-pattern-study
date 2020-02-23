require_relative 'patient'
require_relative 'room_repository'
require_relative 'patient_repository'

rooms = RoomRepository.new('rooms.csv')
patients = PatientRepository.new('patients.csv', rooms)

dandelion = Patient.new(name: 'Dandelion')
vesemir = Patient.new(name: 'Vesemir')

patients.add(dandelion, 2)
patients.add(vesemir, 2)
