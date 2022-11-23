class PagesController < ApplicationController
  def home
    @credit = Credit.first
  end
end
