class CustomersController < ApplicationController

  def index
    customers = Customer.all.order(:id) 

    render json: customers.as_json(
      only: [:name, :registered_at, :address, :city, :state, :postal_code, :phone]), 
      status: :ok 
  end 
end
