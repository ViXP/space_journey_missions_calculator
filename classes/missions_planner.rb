# frozen_string_literal: true

class MissionsPlanner
  attr_reader :destinations, :operations, :path, :total_fuel, :title

  def initialize(destinations:, operations:)
    @destinations = destinations
    @operations = operations
    @missions = []
  end

  def add_mission!(ship_mass, tuples, title = nil)
    tuples_to_routes = tuples.map do |(operation_name, destination_name)|
      [
        validate_tuple_argument(operations[operation_name], "operation '#{operation_name}' is unknown"),
        validate_tuple_argument(destinations[destination_name], "the object '#{destination_name}' gravity is unknown")
      ]
    end

    @missions << Mission.new(ship_mass: ship_mass, routes: tuples_to_routes, title: title)
    @missions.last
  end

  def describe_missions
    @missions.each_with_index do |mission, index|
      puts "#{index + 1}. #{mission.title}" if mission.title
      puts "path: #{mission.path}"
      puts "weight of equipment: #{mission.ship_mass}kg"
      puts "weight of fuel: #{mission.total_fuel}kg"
      puts "\b"
    end
  end

  private

  def validate_tuple_argument(value, error_message)
    return value if value

    raise ArgumentError, error_message
  end
end
