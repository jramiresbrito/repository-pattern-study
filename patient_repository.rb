require 'csv'
require_relative 'patient'

class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @room_repository = room_repository
    @patients = []

    load_csv
  end

  def add(patient, room_id)
    patient.id = @next_id
    patient.room = room_id
    @next_id += 1
    @patients << patient
    room = @room_repository.find(room_id - 1)
    room.add_patients([patient])
    save_to_csv(patient)
  end

  private

  def load_csv
    @next_id = 0
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      row[:room_id] = row[:room_id].to_i
      patient = Patient.new(row)
      @patients << patient
      room = @room_repository.find(row[:room_id] - 1)
      room.add_patients([patient])
      @next_id = patient.id.to_i
    end
    @next_id += 1
  end

  def save_to_csv(patient)
    CSV.open(@csv_file, 'a') do |csv|
      csv << [patient.id, patient.name, patient.cured, patient.blood_type, patient.room.id]
    end
  end
end
