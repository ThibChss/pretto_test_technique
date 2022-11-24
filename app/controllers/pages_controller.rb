class PagesController < ApplicationController
  def home
    @credit = Credit.last
    @new_credit = Credit.new
  end
end
