class Recipe < ApplicationRecord
  
  validates :recipe_name, presence: true

  belongs_to :user
  attachment :cooking_image
  has_many :procedures, dependent: :destroy
  has_many :foods, dependent: :destroy

  accepts_nested_attributes_for :procedures, allow_destroy: true
  accepts_nested_attributes_for :foods, allow_destroy: true


end
