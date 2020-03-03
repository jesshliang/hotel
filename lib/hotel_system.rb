require 'date'

require_relative 'date_range'
require_relative 'reservation'

module Hotel

	class HotelSystem

		attr_reader :reservations

		def initialize
			@rooms = []
			@reservations = []
		end

		def get_all_rooms
			# Hotel has 20 rooms, named 1 - 20.
			all_rooms = []

			20.times do |i|
				all_rooms << (i + 1)
			end
			
			return all_rooms
		end

		# Create a reservation from start date and end date.
		def make_reservation(start_date, end_date)
			range = Hotel::DateRange.new(start_date, end_date)

			new_reservation = Hotel::Reservation.new(range)
			@reservations << new_reservation

			return new_reservation
		end

		# Get all reservations by a specific date.
		def get_reservations_by_date(date)
			found_reservations = []

			@reservations.each do |reservation|
				range = reservation.range.start_date..reservation.range.end_date

				if (range).include?(date)
					found_reservations << reservation
				end
			end

			return found_reservations
		end

		# Get all reservations for a specific room.
		def get_reservations_by_room(room, range_start, range_end)
			found_reservations = []

			@reservations.each do |reservation|
				if reservation.room == room
					if Date.parse(range_start) >= reservation.range.start_date && Date.parse(range_end) <= reservation.range.end_date
						found_reservations << reservation
					end
				end
			end

			return found_reservations
		end

	end

end