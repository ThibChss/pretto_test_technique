class Credit < ApplicationRecord
  validates :borrowed_amount, :duration, :nominal_rate, :guarantee_fee,
            :application_fee, :brokerage_fee, :insurance_rate, presence: true

  # Convert insurance rate in percentage for calcul
  def insurance_percentage
    insurance_rate / 100
  end

  # Convert nominal rate in percentage for calcul
  def nominal_percentage
    nominal_rate / 100
  end

  # Calculate total cost of insurance
  def insurance_cost
    borrowed_amount * insurance_percentage * duration / 12
  end

  # Calculate amount to be refund monthly not including insurance and interest
  def monthly_instalment
    borrowed_amount * ((nominal_percentage / 12) / (1 - ((1 + (nominal_percentage / 12))**-duration)))
  end

  # Calculate total amount of interest
  def interests_amount
    (duration * monthly_instalment) - borrowed_amount
  end

  # Calculate the total cost of the credit
  def credit_cost
    interests_amount + guarantee_fee + application_fee + brokerage_fee
  end

  # Calculate the total amount to refund
  def include_all_fee
    borrowed_amount + credit_cost + insurance_cost
  end
end
