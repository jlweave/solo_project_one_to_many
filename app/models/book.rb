class Book < ApplicationRecord
  belongs_to :library

  def self.only_available
    where({available: true})
  end

  def self.alpha_order
    order(:name)
  end
end