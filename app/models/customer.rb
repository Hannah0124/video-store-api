class Customer < ApplicationRecord

  has_many :rentals

  def as_json(options = {})
    options[:methods] = [:videos_checkout_count]
    super
  end

  def videos_checkout_count
    return 0
  end 
end
