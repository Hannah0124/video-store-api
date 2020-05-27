require "test_helper"

describe RentalsController do

  it "must get index" do 
    get rentals_path
    must_respond_with :ok
  end

  expect(response.header['Content-Type]).must_include 'json' 
end
