# frozen_string_literal: true

class Mission
  attr_reader :title, :ship_mass, :routes

  def initialize(title:, ship_mass:, routes:)
    @title = title
    @ship_mass = ship_mass
    @routes = routes
  end

  def path
    @path ||= routes.inject('') do |path, (operation, destination)|
      "#{path}#{operation.title} #{destination.name}, "
    end[0..-3]
  end

  def total_fuel
    @total_fuel ||= routes.reverse.inject(ship_mass) do |current_mass, (operation, space_object)|
      current_mass + operation.call(current_mass, space_object.gravity)
    end - ship_mass
  end
end
