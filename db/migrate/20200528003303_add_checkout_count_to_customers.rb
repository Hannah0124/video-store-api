class AddCheckoutCountToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :video_checkout_count, :integer, default: 0
  end
end
