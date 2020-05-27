class CustomersController < ApplicationController

  def index
    customers = Customer.all.order(:id) 

    render json: { ok: 'Yes'}, status: :ok 
  end 
end
