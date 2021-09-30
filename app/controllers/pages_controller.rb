class PagesController < ApplicationController
  def home
    @order = current_order
  end
end
