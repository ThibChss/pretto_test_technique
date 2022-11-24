class CreditsController < ApplicationController
  before_action :set_credit, only: %i[show edit update]

  def show; end

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to credit_path(@credit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @credit.update(credit_params)
      redirect_to credit_path(@credit)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_credit
    @credit = Credit.find(params[:id])
  end

  def credit_params
    params.require(:credit).permit(:borrowed_amount, :duration, :nominal_rate, :guarantee_fee,
                                   :application_fee, :brokerage_fee, :insurance_rate)
  end
end
