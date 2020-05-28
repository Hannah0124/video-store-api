class RenameCheckoutCountColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :video_checkout_count, :videos_checked_out_count
  end
end
