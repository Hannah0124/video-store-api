class RentalsController < ApplicationController

  def index
    rental = Rental.all.order(:id) 

    render json: { ok: 'Yes'}, status: :ok 
  end 

  def check_out 
    video = Video.find_by(id: params[:video_id])
    customer = Customer.find_by(id: params[:customer_id])

    
    if video.nil? || customer.nil? 
      render json: {
        errors: ['Not Found'],
      }, status: :not_found 

      return 
    end 


    if video.available_inventory <= 0

      render json: {
        ok: false,
        errors: "Not Available"
      }, status: :bad_request

      return
    end 


    rental = Rental.new(rental_params)
    rental.check_out_date = Date.today
    rental.due_date = Date.today + 7

    if rental.save 
      video.available_inventory -= 1 
      video.save

      customer.videos_checked_out_count += 1
      customer.save 

    
      # render json: rental.as_json(
      # only: [:id, :due_date]), 
      # status: :ok

      render json: {
        customer_id: rental.customer_id,
        video_id: rental.video_id,
        due_date: rental.due_date,
        videos_checked_out_count: customer.videos_checked_out_count,
        available_inventory: video.available_inventory
      },
      # only: [:id, :due_date]), 
      status: :ok

      return

    end
  end

  private

  def rental_params
    params.permit(:customer_id, :video_id)
  end
end
