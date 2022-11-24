class CreditsController < ApplicationController
  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to root_path
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:borrowed_amount, :duration, :nominal_rate, :guarantee_fee,
                                   :application_fee, :brokerage_fee, :insurance_rate)
  end
end
