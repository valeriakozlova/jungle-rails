class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  
  
  validates :rating, presence: true
  validates :description, presence: true

end
