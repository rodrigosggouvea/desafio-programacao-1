class PurchasersController < ApplicationController
  def index
    @purchasers = Purchase.all
  end
end
