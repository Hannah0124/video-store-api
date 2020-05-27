require "test_helper"

CUSTOMER_FIELDS = ["id", "name", "registered_at", "postal_code", "phone", "videos_checkout_count"].sort

describe CustomersController do

  it "must get index" do 
    get customers_path
    must_respond_with :ok
  end

  expect(response.header['Content-Type]).must_include 'json' 
end
