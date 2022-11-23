class Credit < ApplicationRecord
  validates :borrowed_amount, :duration, :nominal_rate, :guarante_fee,
            :application_fee, :insurance_rate, presence: true
end
