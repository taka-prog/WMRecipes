class Procedure < ApplicationRecord

  	validates :no, presence: true
  	validates :detail, presence: true

	belongs_to :recipe
	attachment :picture
end
