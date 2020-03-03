require 'date'
require_relative "test_helper"

describe Hotel::HotelSystem do

	describe "Wave 1 Requirements" do
		before do
			@hotel = Hotel::HotelSystem.new

			@hotel.reservations << Hotel::Reservation.new('dec 1', 'dec 5')
			@hotel.reservations << Hotel::Reservation.new('nov 27', 'dec 2')
			@hotel.reservations << Hotel::Reservation.new('dec 3', 'dec 5')
		end

		it "returns an array of all rooms at the hotel" do
			expect(@hotel.get_all_rooms).must_be_instance_of Array
			expect(@hotel.get_all_rooms[0]).must_equal 1
			expect(@hotel.get_all_rooms[19]).must_equal 20
		end

		it "returns an array of all rooms with reservation including a specific date" do
			date = Date.parse('dec 1')
			expect(@hotel.get_reservations_by_date(date)).must_be_instance_of Array
			expect(@hotel.get_reservations_by_date(date).length).must_equal 2
		end

		it "can access the list of reservations for a specified room and a given date range" do
			room = 10
			range_start = "dec 2"
			range_end = "dec 4"

			expect(@hotel.get_reservations_by_room(room, range_start, range_end)).must_be_instance_of Array
		end

	end

end