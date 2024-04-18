# frozen_string_literal: true

Dir[File.join(__dir__, 'classes', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'classes', 'services', '*.rb')].sort.each { |file| require file }

destinations = [['earth', 9.807], ['moon', 1.62], ['mars', 3.711]].map do |name, gravity|
  [name, SpaceObject.new(name: name, gravity: gravity)]
end.to_h
operations = { launch: Services::LaunchingFuelCalculator, land: Services::LandingFuelCalculator }

planner = MissionsPlanner.new(destinations: destinations, operations: operations)

if ARGV.length > 1
  # Add first mission from app arguments:
  planner.add_mission!(ARGV[0].to_i, eval(ARGV[1]), ARGV[2]) # TODO: eval method is not secure! Injections possible!
else
  # Populate sample missions:
  planner.add_mission!(28_801, [[:launch, 'earth'], [:land, 'moon'], [:launch, 'moon'], [:land, 'earth']], 'Apollo 11')
  planner.add_mission!(14_606, [[:launch, 'earth'], [:land, 'mars'], [:launch, 'mars'], [:land, 'earth']],
                       'Mission on Mars')
  planner.add_mission!(75_432,
                       [
                         [:launch, 'earth'], [:land, 'moon'], [:launch, 'moon'], [:land, 'mars'], [:launch, 'mars'],
                         [:land, 'earth']
                       ], 'Passenger ship')
  puts 'Sample missions:'
end

planner.describe_missions
