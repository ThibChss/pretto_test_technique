class Credit < ApplicationRecord
  validates :borrowed_amount, :duration, :nominal_rate, :guarante_fee,
            :application_fee, :insurance_rate, presence: true
  before_save :convert_nominal_rate_percentage
  before_save :convert_insurance_rate_percentage

  private

  def convert_nominal_rate_percentage
    self.nominal_rate = nominal_rate / 100
  end

  def convert_insurance_rate_percentage
    self.insurance_rate = insurance_rate / 100
  end
end
