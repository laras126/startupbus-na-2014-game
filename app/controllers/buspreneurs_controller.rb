class BuspreneursController < ApplicationController
  respond_to :html

  def show
    @buspreneur = Buspreneur.find(params[:id])
    respond_with @buspreneur
  end
end
