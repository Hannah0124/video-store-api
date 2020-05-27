require "test_helper"

describe RentalsController do

  it "must get index" do 
    get rentals_path
    must_respond_with :ok
    expect(response.header['Content-Type']).must_include 'json'
  end

  
  describe "check_out" do 

    let(:customer) {
      customers(:pengsoo)
    }
    let(:video) {
      videos(:parasite)
    }

    let(:rental_data) {
      {
        customer_id: customer.id,
        video_id: video.id
      }
    }

    it "can let a customer check out" do 
      inventory_nums = video.available_inventory 
      checked_out_video_nums = customer.videos_checked_out_count 

      expect {
        post check_out_path, params: rental_data
      }.must_differ "Rental.count", 1

      must_respond_with :success 

      expect(response.header['Content-Type']).must_include 'json'


      expect(Video.find(video.id).available_inventory).must_equal inventory_nums - 1
      expect(Customer.find(customer.id).videos_checked_out_count).must_equal checked_out_video_nums + 1
    end
  end
end
