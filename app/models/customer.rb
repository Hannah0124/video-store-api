class Customer < ApplicationRecord

  has_many :rentals

  # def as_json(options = {})
  #   options[:methods] = [:videos_checkout_count]
  #   super
  # end

  # def videos_checkout_count
  #   return 0
  # end 

  def increment_checked_out_count
    self.videos_checked_out_count += 1
    self.save
  end

  def decrement_checked_out_count
    self.videos_checked_out_count -= 1
    self.save
  end
end
