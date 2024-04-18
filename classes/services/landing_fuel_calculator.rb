# frozen_string_literal: true

module Services
  class LandingFuelCalculator < FuelCalculator
    FACTOR = 0.033
    ADJUSTMENT = 42
    TITLE = :land
  end
end
