# frozen_string_literal: true

module Services
  class FuelCalculator
    class << self
      def title
        self::TITLE
      end

      def call(mass, gravity)
        full_mass = 0

        until (mass = recalculate_additional_mass(mass, gravity)).negative?
          full_mass += mass
        end

        full_mass
      end

      private

      def recalculate_additional_mass(mass, gravity)
        (mass * gravity * self::FACTOR - self::ADJUSTMENT).floor
      end
    end
  end
end
