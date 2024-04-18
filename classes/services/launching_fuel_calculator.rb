# frozen_string_literal: true

module Services
  class LaunchingFuelCalculator < FuelCalculator
    FACTOR = 0.042
    ADJUSTMENT = 33
    TITLE = :launch
  end
end
