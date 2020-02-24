require 'csv'
require_relative 'room'

class RoomRepository
  attr_reader :rooms
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    @next_id = 0

    load_csv
  end

  def find(id)
    @rooms[id]
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
      @next_id = row[:id]
    end
    @next_id += 1
  end
end
