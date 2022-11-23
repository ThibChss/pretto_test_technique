class Credit < ApplicationRecord
  validates :borrowed_amount, :duration, :nominal_rate, :guarantee_fee,
            :application_fee, :insurance_rate, presence: true

  def insurance_percentage
    insurance_rate / 100
  end

  def nominal_percentage
    nominal_rate / 100
  end

  def insurance_cost
    borrowed_amount * insurance_percentage * duration / 12
  end

  def monthly_instalment
    (borrowed_amount * ((nominal_percentage / 12) / (1 - ((1 + (nominal_percentage / 12))**-duration)))).round(2)
  end

  def interests_amount
    (duration * monthly_instalment) - borrowed_amount
  end

  def include_all_fee
    borrowed_amount + guarantee_fee + application_fee + insurance_cost + interests_amount
  end
end
