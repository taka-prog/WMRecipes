class Food < ApplicationRecord

  	validates :food_name, presence: true
  	validates :amount, presence: true
	
	belongs_to :recipe

end
