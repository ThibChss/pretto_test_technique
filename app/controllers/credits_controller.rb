class CreditsController < ApplicationController
  def create
    @credit = Credit.new(credit_params)
  end

  private

  def credit_params
    params.require(:credit).authorize(:borrowed_amount, :duration, :nominal_rate, :guarantee_fee,
                                      :application_fee, :brokerage_fee, :insurance_rate)
  end
end
