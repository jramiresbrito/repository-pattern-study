require_relative 'patient'
require_relative 'patient_repository'

repository = PatientRepository.new('patients.csv')

dandelion = Patient.new(name: 'Dandelion')
repository.add(dandelion)

p repository
