class RentalsController < ApplicationController

  def index
    rental = Rental.all.order(:id) 

    render json: { ok: 'Yes'}, status: :ok 
  end 

end
