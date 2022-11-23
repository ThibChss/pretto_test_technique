class Credit < ApplicationRecord
  validates :borrowed_amount, :duration, :nominal_rate, :guarante_fee,
            :application_fee, :insurance_rate, presence: true

  def insurance_percentage
    insurance_rate / 100
  end

  def nominal_percentage
    nominal_rate / 100
  end
end
