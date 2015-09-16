class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def new
  end

  def create
    @sale = ImportFile.import(params[:file])
    if @sale.valid?
      redirect_to @sale, notice: "Venda cadastrada!"
    else
      redirect_to :new, error: "Houve um erro. Por favor, tente novamente."
    end
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
