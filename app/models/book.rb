class Book < ApplicationRecord
  belongs_to :library

  def self.only_available
    where({available: true})
  end
end