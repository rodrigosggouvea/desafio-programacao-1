class PurchasersController < ApplicationController
  def index
    @purchasers = Purchaser.all
  end
end
