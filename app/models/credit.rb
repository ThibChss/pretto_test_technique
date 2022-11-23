class Credit < ApplicationRecord
  validates :borrowed_amount, :duration, :nominal_rate, :guarante_fee,
            :application_fee, :insurance_rate, presence: true
  before_save :convert_rate_percentage
  after_initialize do
    self.nominal_rate = (nominal_rate * 100).round(2)
    self.insurance_rate = (insurance_rate * 100).round(2)
  end

  private

  def convert_rate_percentage
    self.nominal_rate = nominal_rate / 100
    self.insurance_rate = insurance_rate / 100
  end
end
