class Customer < ApplicationRecord

  has_many :rentals

  def as_json(options = {})
    options[:methods] = [:videos_checked_out_count]
    super
  end

  def videos_checked_out_count
    return 0
  end 
end
