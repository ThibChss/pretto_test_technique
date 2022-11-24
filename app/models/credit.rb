class Credit < ApplicationRecord
  validates :borrowed_amount, :duration, :nominal_rate, :guarantee_fee,
            :application_fee, :brokerage_fee, :insurance_rate, presence: true

  # Convert months in years
  def duration_in_years
    duration / 12
  end

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
    borrowed_amount * insurance_percentage * duration_in_years
  end

  # Calculate amount to be refund monthly not including insurance
  def monthly_instalment
    (borrowed_amount * ((nominal_percentage / 12) / (1 - ((1 + (nominal_percentage / 12))**-duration)))).round(2)
  end

  # Calculate amount to be refund monthly including insurance
  def monthly_instalment_w_insurance
    monthly_instalment + (insurance_cost / duration)
  end

  # Calculate total amount of interest
  def interests_amount
    (duration * monthly_instalment) - borrowed_amount
  end

  # Calculate the total cost of the credit without insurance
  def credit_cost
    interests_amount + guarantee_fee + application_fee + brokerage_fee
  end

  # Calculate the total cost of the credit including insurance
  def credit_cost_w_insurance
    credit_cost + insurance_cost
  end

  # Calculate the total amount to refund
  def include_all_fee
    borrowed_amount + credit_cost_w_insurance
  end

  # Calculate the annual percentage rate of charge
  def calculate_aprc
    (include_all_fee - borrowed_amount) / borrowed_amount * duration / duration_in_years
  end
end
