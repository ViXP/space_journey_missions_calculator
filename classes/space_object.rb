# frozen_string_literal: true

class SpaceObject
  attr_reader :name, :gravity

  def initialize(name:, gravity:)
    @name = name.capitalize
    @gravity = gravity
  end
end
