require 'csv'
require_relative 'patient'

class PatientRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @patients = []
    @next_id = 1
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_to_csv(patient)
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    @next_id = 0
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      @next_id = row[:id]
    end
    @next_id += 1
  end

  def save_to_csv(patient)
    CSV.open(@csv_file, 'a+') do |csv|
      csv << [patient.id, patient.name, patient.cured, patient.blood_type]
    end
  end
end
